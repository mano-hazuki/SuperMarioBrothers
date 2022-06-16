public class Stage {

    private final Area[] areas;

    /* A number of the stage */
    private final int majorNumber;
    private final int minorNumber;

    public Stage(Area[] areas, int majorNumber, int minorNumber) {
        this.areas = areas;
        this.majorNumber = majorNumber;
        this.minorNumber = minorNumber;
    }

    public Area[] getAreas() {
        return areas;
    }

    public int getMajorNumber() {
        return majorNumber;
    }

    public int getMinorNumber() {
        return minorNumber;
    }
}

public class StageManager {

    /* The list of stages */
    private Stage stage11 = new Stage(new Area[]{areaManager.ground11, areaManager.underground11}, 1, 1);

    private Stage currentStage;
    private Area currentArea;

    private int areaIndex = 1;

    public StageManager() {
        currentStage = stage11;

        currentArea = currentStage.getAreas()[areaIndex];
        areaManager.loadArea(currentArea);
    }

    public Stage getCurrentStage() {
        return currentStage;
    }

    public Area getCurrentArea() {
        return currentArea;
    }
}

public class StageRenderer {

    public void drawCurrentArea() {
        areaManager.drawArea(stageManager.getCurrentArea());
    }
}
