Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web12.6484.1603756652817732505
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 16:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=mBGu7I4+;
 spf=pass (domain: foundries.io, ip: 209.85.210.54, mailfrom: ricardo@foundries.io)
Received: by mail-ot1-f54.google.com with SMTP id n11so9644343ota.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=qswUz2ESsa44HArS/YstVfQQHsZBj3WhshcpzNAbck0=;
        b=mBGu7I4+otAvhV4OVZjKFu/QOY0tk0mdhoObMMjkQMGQhd5sAW4g3iH5RWtuFzlARD
         8UEeq58WuhtYHgKN3SDJIJVS/NkxVpqbStob6RxhrfxDd1V4pUyvNWhwhCr+zaQJ6qnn
         Ds0gA3wsFs/FUEB4qDwRn5dndmdRWoC9QUUwpUNCUdwznZ1tFWuHPYM2aAKOGXMpBrvs
         rSj5TkBQ+ZXp1Ih3nOtyizvD08jvIh5V1H9WrfAGXa9lA/GnboyCERNuCwFQGe0bwDXQ
         KwO+bVek0jjCuO35YC7j+9g0U31a2swJChsAi5uyvYLBt0vw+lnHozKTURAKd/88TmbL
         KCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qswUz2ESsa44HArS/YstVfQQHsZBj3WhshcpzNAbck0=;
        b=DvGNdoZvTVkvj+WkqBeAp7NG3huJVuVIDF5PCTbdpkWaItlNN6KXayGKx/HXgtvB6O
         JZK1XEiUntfTEksZwbt3p1U8IAFoNxmOEL2FXI4jlVAVBKvSdkjhzCP1edE6moH7dg2/
         PlHERHTLStGy9x3BHDDSD56VfwBPkIYV2Gy61PTFWA6xCFzs8wSRSoxIASV8dS3vUvP/
         Rzyp3wPByhnIhza6N6z6OkkdiCyRnYt/+74CMYKDjDoyjEHp1qkj5R+Oqguj0wnsaO5k
         2/r+LNYp7AYWSZxmE7I/+/0GihCnV0VKT8U3Awn5DqTWWtYPZH9ajNS3v9PVyFB0QKpm
         JhYw==
X-Gm-Message-State: AOAM533eh62gOVCEF5CPnuKizmA1QFNddAKUYQuJJNKrwdYtm6xyvLmp
	gdro0A2TxtaEV3NFECv3NlMHXote5wg8CFdsz8DT0l8Niw==
X-Google-Smtp-Source: ABdhPJyHI4aatcPYx5Uf46dME+IA9szfbr1OS65p3GUfE+2pNWfymrbjOxXCucXOwtXE9YI46b09yYlI+8z+5FE7TBg=
X-Received: by 2002:a9d:7586:: with SMTP id s6mr15551423otk.46.1603756651735;
 Mon, 26 Oct 2020 16:57:31 -0700 (PDT)
MIME-Version: 1.0
From: "Ricardo Salveti" <ricardo@foundries.io>
Date: Mon, 26 Oct 2020 20:56:55 -0300
Message-ID: <CAAaKDhG7X77t=Z1C5sTGZkycOvNj=VNE5swKXQmgsmrg_bJrYA@mail.gmail.com>
Subject: Upstream state of the U-Boot patches
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using meta-arm-bsp for providing BSP support for corstone700
(mps3/fvp) and a5ds, and noticed that quite a few u-boot specific
patches are still pending to be sent upstream.

This was already the case with the previous ARM bsp layer (before
meta-arm), so I wonder if there is any push for landing those in
u-boot itself, instead of maintaining as part of the bsp layer.

Looking at the u-boot mailing list, most were not yet submitted. Do we
know if the direction here is to keep them as part of this layer or if
there is anyone actively working on upstreaming those at ARM?

This is mostly to guide me on the best way to maintain compatibility
with those as I move to newer u-boot releases.

Thanks!
-- 
Ricardo Salveti
