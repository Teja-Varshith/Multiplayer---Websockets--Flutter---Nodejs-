const mongoose = require("mongoose");
const player = require("./player");

const room = new mongoose.Schema({
    occupancy: {
        type: Number,
        default: 2,
    },

    maxRounds: {
        type: Number,
        default: 6,
    },

    currentRound: {
        type: Number,
        required: true,
        default: 1,
    },

    players: [
        player
    ],

    isJoin: {
        type: Boolean,
        default: true,
    },

    turn: player,

    turnIndex: {
        type: Number,
        deafult: 0
    }
});

const gameModel = mongoose.model('room',room);

module.exports = gameModel;