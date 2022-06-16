public class Block {

    private final PImage image;

    private final Sprite sprite;

    private final int posX;
    private final int posY;

    private boolean solid;

    private final Animator animator;
    private final boolean animatable;

    public Block(PImage image, int posX, int posY, boolean solid) {
        this.image = image;
        this.posX = posX;
        this.posY = posY;
        this.solid = solid;

        sprite = null;
        animatable = false;
        animator = null;
    }

    public Block(Sprite sprite, int posX, int posY, boolean isSolid) {
        this.sprite = sprite;
        this.posX = posX;
        this.posY = posY;
        this.solid = isSolid;

        image = null;
        animatable = true;
        animator = new Animator(sprite, 150);
    }

    public void draw() {
        if (animatable) {
            animator.animate();

            image(animator.getCurrentImage(), posX, posY);
        } else {
            image(image, posX, posY);
        }
    }

    public PImage getImage() {
        return image;
    }

    public Sprite getSprite() {
        return sprite;
    }

    public int getPosX() {
        return posX;
    }

    public int getPosY() {
        return posY;
    }

    public void setSolid(boolean solid) {
        this.solid = solid;
    }

    public boolean isSolid() {
        return solid;
    }

    public boolean isAnimatable() {
        return animatable;
    }
}

public class BlockAir extends Block {

    public BlockAir(int posX, int posY) {
        super(textures.air, posX, posY, false);
    }
}

public class BlockGround extends Block {

    public BlockGround(int posX, int posY) {
        super(textures.ground, posX, posY, true);
    }
}

public class BlockGroundDark extends Block {

    public BlockGroundDark(int posX, int posY) {
        super(textures.groundDark, posX, posY, true);
    }
}

public class BlockBrick extends Block {

    public BlockBrick(int posX, int posY) {
        super(textures.brick, posX, posY, true);
    }
}

public class BlockBrickDark extends Block {

    public BlockBrickDark(int posX, int posY) {
        super(textures.brickDark, posX, posY, true);
    }
}

public class BlockStair extends Block {

    public BlockStair(int posX, int posY) {
        super(textures.stair, posX, posY, true);
    }
}

public class BlockStairDark extends Block {

    public BlockStairDark(int posX, int posY) {
        super(textures.stairDark, posX, posY, true);
    }
}

public class BlockQuestion extends Block {

    public BlockQuestion(int posX, int posY) {
        super(sprites.questionBlock, posX, posY, true);
    }
}

public class BlockUsedQuestion extends Block {

    public BlockUsedQuestion(int posX, int posY) {
        super(textures.usedQuestionBlock, posX, posY, true);
    }
}
