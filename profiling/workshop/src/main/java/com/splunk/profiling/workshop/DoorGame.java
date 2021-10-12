package com.splunk.profiling.workshop;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import static java.lang.Thread.sleep;

public class DoorGame {

    private final Map<String,GameInfo> games = new HashMap<>();

    public String startNew() {
        String uuid = UUID.randomUUID().toString();
        Random random = new Random();
        int winningDoor = random.nextInt(3);
        games.put(uuid, new GameInfo(uuid, winningDoor));
        Util.sleep(1000);
        return uuid;
    }

    public int reveal(String uid) {
        GameInfo gameInfo = games.get(uid);
        return gameInfo.getDoorToReveal();
    }

    public void pick(String uid, int picked) {
        GameInfo gameInfo = games.get(uid);
        gameInfo.pick(picked);
    }

    public String getOutcome(String uid, int picked){
        GameInfo gameInfo = games.get(uid);
        return gameInfo.isWinner(picked) ? "WIN" : "LOSE";
    }
}
