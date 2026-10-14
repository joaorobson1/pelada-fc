
from PIL import Image, ImageDraw
from pathlib import Path

public = Path("public")
public.mkdir(exist_ok=True)

for tamanho in [192, 512]:
    img = Image.new("RGB", (tamanho, tamanho), "#101827")
    draw = ImageDraw.Draw(img)

    margem = int(tamanho * 0.15)

    draw.ellipse(
        (margem, margem, tamanho - margem, tamanho - margem),
        outline="white",
        width=max(3, tamanho // 35)
    )

    draw.text(
        (tamanho / 2, tamanho / 2),
        "FC",
        fill="white",
        anchor="mm",
        stroke_width=1
    )

    img.save(public / f"pwa-{tamanho}x{tamanho}.png")

print("Ícones criados com sucesso!")
