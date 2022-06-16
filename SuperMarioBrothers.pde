public Textures textures;
public Sprites sprites;

public AreaManager areaManager;

public StageManager stageManager;
public StageRenderer stageRenderer;

void setup() {
    fullScreen();

    textures = new Textures();
    sprites = new Sprites();

    areaManager = new AreaManager();

    stageManager = new StageManager();
    stageRenderer = new StageRenderer();
}

void draw() {
    // Clear the buffers within pixels
    clear();

    stageRenderer.drawCurrentArea();
}
