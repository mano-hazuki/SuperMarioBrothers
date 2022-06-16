public class Sprite {

    private final PImage sheet;

    private final int width;
    private final int height;

    private final ArrayList<PImage> images;

    public Sprite(PImage sheet, int width, int height) {
        this.sheet = sheet;
        this.width = width;
        this.height = height;
        this.images = loadImages();
    }

    private ArrayList<PImage> loadImages() {
        sheet.loadPixels();

        ArrayList<PImage> images = new ArrayList<PImage>();
        int quantity = sheet.height / height; // The quantity of images
        int j = 0;
        int y = 0;

        for (int i = 0; i < quantity; i++) {
            PImage tempImage = createImage(width, height, RGB);

            while (j < (height * (i + 1)) - 1) {
                for (int k = 0; k < width - 1; k++) {
                    tempImage.pixels[y * width + k] = sheet.pixels[j * width + k];
                }
                j++;
                y++;
            }
            tempImage.updatePixels();
            images.add(tempImage);
            y = 0;
        }
        return images;
    }

    private int getWidth() {
        return width;
    }

    private int getHeight() {
        return height;
    }

    public ArrayList<PImage> getImages() {
        return images;
    }
}

public class Sprites {

    public final Sprite questionBlock;

    public Sprites() {
        this.questionBlock = new Sprite(textures.spriteSheetQuestionBlock, 64, 64);
    }
}

public class Animator {

    private Sprite sprite;

    private int duration;

    private int last;

    private int index;

    private boolean animating;

    private PImage currentImage;

    public Animator(Sprite sprite, int duration) {
        this.sprite = sprite;
        this.duration = duration;

        last = millis();
        animating = true;
    }

    public void animate() {
        if (!animating) {
            return;
        }
        currentImage = sprite.getImages().get(index);

        int now = millis();

        if (now - last >= duration) {
            if (index >= sprite.getImages().size() - 1) {
                index = 0;
            } else {
                index++;
            }
            last = millis();
        }
    }

    public void resume() {
        animating = true;
    }

    public void pause() {
        animating = false;
    }

    public PImage getCurrentImage() {
        return currentImage;
    }
}
