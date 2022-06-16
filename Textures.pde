public class Textures {

    /* Images of stage background */
    public PImage backgroundCyan;
    public PImage backgroundBlack;

    /* Images of blocks */
    public PImage air;

    public PImage ground;
    public PImage groundDark;

    public PImage brick;
    public PImage brickDark;

    public PImage stair;
    public PImage stairDark;

    public PImage usedQuestionBlock;

    public PImage spriteSheetQuestionBlock;

    public Textures() {
        // Backgrounds
        backgroundCyan = loadImage("background_cyan.png");
        backgroundBlack = loadImage("background_black.png");

        // Blocks
        air = loadImage("air.png");
        ground = loadImage("ground.png");
        groundDark = loadImage("ground_dark.png");
        brick = loadImage("brick.png");
        brickDark = loadImage("brick_dark.png");
        stair = loadImage("stair.png");
        stairDark = loadImage("stair_dark.png");
        usedQuestionBlock = loadImage("question_block_used.png");

        spriteSheetQuestionBlock = loadImage("sprite_question_block.png");
    }
}
