import express from 'express'


import { getAllUser, register } from './user.controller.js'

const router = express.Router()

router.route('/').get(getAllUser)
router.route('/').post(register)
export default router
