Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B421C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:24:07 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.41373.1747974239693853695
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 21:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=NP4W0QHV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.51, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2d5e5e21b92so3877981fac.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747974239; x=1748579039; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N7pqJ03T87mYtrpp+EFkDSm5CeyWIC8pM4f6s7ahw8=;
        b=NP4W0QHVU/vH3GNKHDKNRvTceblznCRWcBXHM/c4KM2U0soFZgnE7AQEFoirJYmcDV
         kqIebEyS2JNL4lKZ5XRKlarXIx5Y3OWbWiNd56CFtKCkhuGPT2tN/FjwjMuZggH/XHza
         8Y2QqAMQpqrHpoTg1dWjh+cVMJ/7sa+D/Kkb/kPTdGrBSV2FtsH42UaqOOBhtHT8ezb4
         YTHDD0Vs1WTNOY1E6GgM5BsHzr1H5bGIowK1zEJMTTXhhcdOfoHriF8kGBaHlh6lWlZe
         YakPoCTszIhBpWn7z2VKs2yaVRWhOHP3ZBnuHi53Q0IAleoC3KMhUHVwH8cdcUzfZpEA
         1Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747974239; x=1748579039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1N7pqJ03T87mYtrpp+EFkDSm5CeyWIC8pM4f6s7ahw8=;
        b=WKQ7MgPcGn+tnhc/SvrobDWxsdrfgD9Yu41snj4tmYxavAVAQ0j0V3aRcYnLy1OY+C
         L6nxe8Crh2qk0oW04vLji+C4endlfrsCW0UfZ+KZKcuKGk8PDjjiLUA3hh6CulGd0CST
         I5frSv6/FAN1WEtgmJr279BG3tJLRYTjJ8rsqmiOfDIuFzojkdGh0kP783AuPOrJcbm4
         q8YIQ+NYli1ZD6M/HWLgYYYdNYinzYsb+XieoVv04RWgd9kqMljmw0AFVE7LK/hQFsq4
         d8KiNv8SNuFL/zofrdYAZ5yuRoJp8H0lmTJZSHGFiGdMHJDANKu4wRclDnlxMk8DaRGD
         PP5g==
X-Gm-Message-State: AOJu0YySuSMv1HtP5QGlGvRuerWQdC9yLXH0c4o9eZ3ZlCsDLm7aSAqH
	esEMBtmOmFYA17w3SYD9R5wHAXN/8hXpPzBH6mcKxRHa1EP5VYQwHzxeDiz1THjfYhYRX/1B78a
	H81OA9g==
X-Gm-Gg: ASbGncu4Or+iaH0JoYEIOZ7bnLwV/dtU1M38Oi1NewlETtCiGKQpt/CGp6CLh2815ZS
	Lc/42URNX4zPrx3oXpaZa1baeTskY+9P6PaHqhamAt+kT+0QPorjw0NpHkg9O2txayKI70xPXTz
	BVQTgTPETW5QEQfvdZnRrXdD3olnI7TObvcfeD1J1qQTAGuqe0W5h5AWNO2q1QFoFH+UmZokrjG
	TsAmZ/BKc4Uvkuuh4VZtEAmCUDulTQ9i8DZHE1YkdFCEyEf9wHmaO38/+6UYYN/Np0HHtKJOVPt
	3YN8+QkHeQBjpfGhYTKlX7/MefGavhnJhN54bVAF3Ig=
X-Google-Smtp-Source: AGHT+IEF9YeoV0A3jnazj2YSv9Lv30xopi8WlBzCgOcHbdG0cTcfh1HvNldathKq3f9EzbVe9OgGcw==
X-Received: by 2002:a05:6214:2022:b0:6fa:8c07:2daf with SMTP id 6a1803df08f44-6fa93a6fb8cmr29247956d6.32.1747974228304;
        Thu, 22 May 2025 21:23:48 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b098750csm108719046d6.119.2025.05.22.21.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 21:23:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] Revert "CI: use walnascar branches"
Date: Fri, 23 May 2025 00:23:18 -0400
Message-Id: <174797419805.2415316.9796309060554655669.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522124202.2127221-1-ross.burton@arm.com>
References: <20250522124202.2127221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 May 2025 04:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6524


On Thu, 22 May 2025 13:42:02 +0100, Ross Burton wrote:
> This switches CI back to using the master branches.
> 
> Currently there are two known failures:
> - sbsa-ref
> - perf on musl
> 
> This reverts commit e0c1f0f94a3e3827f1e8bf0922b62617fd0c073f.
> 
> [...]

Applied, thanks!

[1/1] Revert "CI: use walnascar branches"
      commit: fe6aa835ef08b8a89be11a30559c0cb8e1ce8590

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

