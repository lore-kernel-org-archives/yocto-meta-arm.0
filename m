Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45ADC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 15:33:48 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.20014.1738078420438822794
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 07:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PK/9jBl7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.50, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-29fad34bb62so2949824fac.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 07:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1738078419; x=1738683219; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7OOAXdrRg90KDCFKjTJlgwGkC0vaJnRKlH9nRYTUPM=;
        b=PK/9jBl7xo65VAmBjw2Q8I5zChxOuRLvmJBaYsJRAYK9B133CcmtzRcxPVToYukgdS
         SLWPqJJ/pSYpwTwmxW/abUNMxh8bjtIXAeQaS3GDsJjVdM16VzQa+0a1zId8xvn/x0OQ
         oLCjVk6gbbYTlQ8QwwAT7BYEivmg2wQMojS3dcLh6O4PR7VBypcQ2hxwOlUQ122RIGxa
         8vAbIQLH8rgS7eq9IpyUks8zuJ8OODvs2Fm69qC/ndndn0AcLymn4PXjNNIMujMmQHjE
         cVWqMDp7BNAjX/SBNlLHIfwdCAdid0uWb7K+OmFbyA9v485vd8WDmfIcvfCYTVjt5svi
         DIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738078419; x=1738683219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7OOAXdrRg90KDCFKjTJlgwGkC0vaJnRKlH9nRYTUPM=;
        b=oaQ7Ry5vlqbiC/9/qafFbdq0r3NwtwZpKDhi9npk30YKB64evOOk7lGAsmJaImqtWz
         H0hcM8OeTLsfIq7yv0CG5rwst+s0SVqxq9rFEhutxmqsICu6dUH+1iBPSEHCu1arWuRW
         SldpmtVa8yRTLIrfCEbpO8lQ8P+XFheLF/APfBMQt3QBLuKlLohbi/s/3/lsxXnyu2RD
         drFIsYf7KPzhCJMzA2/VQpinXn2PHFk+UjgkcsbbgNwLeiggLjzKWqzm0f+AP5kCI1fQ
         VbXVbdgMNuEbtjuY4es/sEKmPIV7Yc98ZOBrL8LG0tCw2MpWdcNPdAYZjmLu08HtnqZG
         ApQA==
X-Gm-Message-State: AOJu0Yxm4w3zc0GdVUKbwIQOtVPZrNusASCHgakEuvkW4GHLyOJxgzEu
	ZgFpKbL0jNVqfUhxDS8vr23FEqpc5NCbTV9LfhjOGize22SA6rkZBxszkuJf2nG73M4ZBNZ0F9C
	mGtzWvzYulJJ3/pLKH7aHJQDkb5byjQTt+sbA
X-Gm-Gg: ASbGncvB/1/ZrqAxz5h+d7PKsBZuc3KfJCk2vuonHGp9y+DPzQ8FRXHr7Lc/asfyMIg
	608ua7a+9ThwUSGY9Uzsfe+zsO++R93cLlNtPMOllcJPova9eFIE5Vtp4gQZPhqFo7TGSmEvW5Q
	==
X-Google-Smtp-Source: AGHT+IH6FKcPh9cQURROoL5FyEDJ+lVRKvASUTe/t0pyJDSGveU8M5iGMSzSnkPaGZLcodChvjDToi3DbY5/xlH8Fsw=
X-Received: by 2002:a05:6870:3909:b0:296:9c08:51a3 with SMTP id
 586e51a60fabf-2b1c0c886f3mr24876302fac.39.1738078419305; Tue, 28 Jan 2025
 07:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20250127072356.852345-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250127072356.852345-1-mikko.rapeli@linaro.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 28 Jan 2025 15:33:28 +0000
X-Gm-Features: AWEUYZlcesLHxu3vfabNMCi9ClfgKSk-K-0pc8yAlPG4RiLR_4aaOfLi652ZQL8
Message-ID: <CAPoiz9wANA-Tgub4G+AXs_yQf9-NyKsSOJX5J0z=qOu8=jA42A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] systemd-boot: update systemd-bootaarch64.efi path
To: mikko.rapeli@linaro.org
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 15:33:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6353

On Mon, Jan 27, 2025 at 7:24=E2=80=AFAM Mikko Rapeli via
lists.yoctoproject.org
<mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org> wrote:
>
> poky updated systemd from 256 to 257 which changed
> the build time path.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

I tried this out a couple weeks ago.
https://gitlab.com/jonmason00/meta-arm/-/jobs/8885513336
Essentially, systemd changed more than just the location.  It changed
UKI fairly significantly, and that is failing to generate an
authenticated image.
I was able to bisect it to the systemd commit
https://github.com/systemd/systemd/commit/2188c759f97e40b97ebe3e94e82239f36=
b525b10

I ran out of time to bug this further, and meant to email you with the abov=
e.

I'm hesitant to apply a patch that doesn't fully resolve the issue
(though Ross might have a different opinion).  So, if you can manage
to fix the systemd UKI issue, I'd be willing to take it then.

Thanks,
Jon

> ---
>  meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.i=
nc b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> index 84196a68..9d72dac5 100644
> --- a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> +++ b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> @@ -1,6 +1,6 @@
>  inherit sbsign
>
> -SBSIGN_TARGET_BINARY =3D "${B}/src/boot/efi/systemd-boot${EFI_ARCH}.efi"
> +SBSIGN_TARGET_BINARY =3D "${B}/src/boot/systemd-boot${EFI_ARCH}.efi"
>
>  do_compile:append() {
>      do_sbsign
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6350): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6350
> Mute This Topic: https://lists.yoctoproject.org/mt/110835165/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

