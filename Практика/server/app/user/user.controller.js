import { hash } from 'argon2'
import asyncHandler from 'express-async-handler'

import { prisma } from '../prisma.js'

export const getAllUser = asyncHandler(async (req, res) => {
	const users = await prisma.user.findMany()

	res.json(users)
})

export const register = asyncHandler(async (req, res) => {
	const { email, password, fullName, role } = req.body

	const isHaveUser = await prisma.user.findUnique({
		where: {
			email
		}
	})
	if (isHaveUser) {
		res.status(400)
		throw new Error('Пользователь существует')
	}

	const user = await prisma.user.create({
		data: {
			email,
			password: await hash(password),
			fullName,
			role
		}
	})

	res.json(user)
})
