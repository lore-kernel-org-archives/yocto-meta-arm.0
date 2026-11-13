Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12514.1794580182387905061
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 06:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20260707.gappssmtp.com header.s=20260707 header.b=edIvuALZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53512cd2f85so20835491cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2026 06:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20260707.gappssmtp.com; s=20260707; t=1794580181; x=1795184981; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR/M44k+9dzSry1IQS4Ko4TNi7BvVJbY2x4OW5KyWUo=;
        b=edIvuALZcx16AbKgi0I15ftUIwyaYs49DN11YIfBJgX+of57lfhPEqhzMj0yVL6Zoc
         yUW60Z1oRIJIRxCBfDCSbcKR5v7he78jI8rBgetbxNYnYIkH8+O/lUDXzcGca7NGR9uW
         vlivRvOgpxGBDVHAJIVSZfH/BvZIJYbJPS5snP7z6DT0TcESUzXro8CWTV9AfxklwOP4
         ybsvI0w6IUKZMyKhO6JwmomQ1VfcZtYZykiOANyiT55zbkoIKcNSW815+yK5eS55tVxc
         wKryssOvkVW3exBEto3maDvdYVi9mDaZUec7PQ6zzDZas6JTAr3zqEIxzBcTixVOqNfO
         Y5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580181; x=1795184981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR/M44k+9dzSry1IQS4Ko4TNi7BvVJbY2x4OW5KyWUo=;
        b=RU3N2ivbf3edwVr9OcF5Xki/1Wdw9LzK/nHWCLHK4NCYNy4IyF+EwYGLHfNJTUywyh
         5AIjBfMBFCugjS6Jhq05HdZf8sHrAyBeoQhbJ9NhJ38z/k90+UElvKXwVC9DlaXL2rzG
         yOVgS5nvhMRKZtU9ruA2vpQzQDAvbn59xw1T5CFAE6flkjfavhL4EE7dOJtN0GZp1MJ/
         N+jOgmzpQvciBD3ybzMhNAY11hFQ7tBiZ6fOTgze83K1OH53/8HByBZOKi2hkWHIkzGa
         OOnKM/w2g85F07LHp+ZbMk0qA27hgCZSq14nIAX4x6D7bpj4j0AmXXkPfMa4fREM2z+W
         +9Ng==
X-Gm-Message-State: APuU4Z95/C2RvbGZj7qBwFSMFwIBOIt2etmCZAyIH4gZtif/acUSxhak
	eSv8Y0pUO4UNKgpEOqnFawy2cflonrWutDyLzCLaS25wYt7Jk7+OY6Wpp1KHV7XjO3kpL35J2V5
	/XBg=
X-Gm-Gg: AYBFou3vDJBEGtKnvTqH1zHbRgQnPaZ4LJCI2NXljkNx4lTpuI2ycXafw4mi+F2Yh/l
	u2R5Ft/6nHAwkb/353zYsg6VMIntiWHo1lzkpdtQ+DRTpY0Wp45l8ZYzuhYyBOyQA1N91G3PmIw
	rHkA/SA1GkXHnZYRN5K/Ms0XYB2ZMZnEkQg9dAmGWFb44yQu0iLhSu7C0I1M54dHJE6vHGl/ELZ
	LKh8okxdlLlVRNEbSt3Vl3EQJgzrXKVVbHjhrbY9HU/GaR3yB9kAoNrW72emiw7KesaUAcBb9CS
	2y4X9KBUj/QRcf0BzVRQvPN+Juqn/tdc7ZtiEvCuo4sigE0U5j7OvMDGQ2i9p6RPCj7YjRvlG5X
	nEP3ut7pOiJEXb0PCgKDOFI/twNPfQ/b+Qc+SMzHlxZWJcRkkLQW+laGQv1cSW4Sdva38cbeHlQ
	IvDJuyu1BgWG4zsn/vhDHYopn3C2qiH7P1aChIdyOd6sW/0MJRuya8UNFIVSJ6+7rKglxxI/CE3
	UBT9eknpzToefa7/oSsfIbQo1FEkaZRyvLM0Iz79KrE+ErW+43HqGMl1AfSUmyReh2untUG1W9u
	Ig17zLDZvlXWl0ijCqg=
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr39495001cf.18.1794580180925;
        Fri, 13 Nov 2026 06:29:40 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad15eec81sm19513751cf.27.2026.11.13.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:29:40 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Denys Dmytriyenko <denis@denix.org>
Subject: Re: [PATCH] optee-os-tadevkit: Allow empty SPDX deploy artifacts
Date: Fri, 13 Nov 2026 09:29:28 -0500
Message-Id: <179458017085.2164217.15268358198767594032.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261112215035.1552514-1-denis@denix.org>
References: <20261112215035.1552514-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2026 14:29:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7218


On Thu, 12 Nov 2026 16:50:35 -0500, Denys Dmytriyenko wrote:
> OE-Core has added support for deploy tasks to create SPDX [0].
> optee-os-tadevkit doesn't deploy anything and needs to set
> SPDX_DEPLOY_ALLOW_EMPTY so that it doesn't generate an error,
> similar to [1].
> 
> [0] https://git.openembedded.org/openembedded-core/commit/?id=1b77fe51ec77ae0bdea016fe4bbe76ac73b1f3d1
> [1] https://git.openembedded.org/openembedded-core/commit/?id=34991d0ce3cc5f38dd29e824af7579512d2b917e
> 
> [...]

Applied, thanks!

[1/1] optee-os-tadevkit: Allow empty SPDX deploy artifacts
      commit: 43f47aac1adc6d1fafa4f6d0103f98f269cac047

Best regards,
-- 
Jon Mason <jon.mason@arm.com>
