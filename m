Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594DFFEFB7E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:00:54 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103870.1772218852287430477
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 11:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=TeDt6jlb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5069b3e0c66so47786721cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1772218851; x=1772823651; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Swy+74c/HmgR73SPP+auMo0w57SiCKQGHdqE//riGdk=;
        b=TeDt6jlbNntUcDlBrv7W38hG5xb3IAwLDEGRniN2okSj7aKl9z8MDG0P9JUos0Wdtt
         skHLk9f17cnWLDQv2s5DtUyqcvtGegglkqG4vZavYf9YxjA7HWvbRyCtggOX5d5DcLKd
         sAEp63YP/9MWz8bHTgqF0/1sck7ruwytw9T2cJ29d884uM+9e8R4Dr3zaWwc99fYrad6
         JrHlart7fG2h3fS7pMmuZnwP5Gd0SSCxYhOWvnOkbllSBB3YEOST8rzosa2TWRylFRtp
         cg5GsWzDpg4mBo3s1GKsWp5faADHNGPv4CBLwHA1SI71W45yrx28P6Aara3xARLQHRb5
         YXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218851; x=1772823651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Swy+74c/HmgR73SPP+auMo0w57SiCKQGHdqE//riGdk=;
        b=XBy0gHyGxNves2ppv1VNEgfV9RGSQYizfu4WFCYlLj6c7RT2NZPJG/DlAP8bp17WIX
         3hprIQfFsVQjLMTkkPqfjM+M/TnfrkfV6BiFTk8GEdJx2OEZ2vYVY9Raf5PsRlzLLIGb
         nbiqGB/DISc+tFTi6B7L/4yw5wkHnVLAe/BgIiMM6NUwNiim7quTwO0u70g9ff6UZbSB
         xyNEmgBQ83cIsDLhsUAoTA63i4q7IClOhX86T6bSQDO9sb93btg5BFf/lptwwUAOxCBX
         5l2TgICR2pYChi9s+fuobplxU//ysRJl614kScsa70bauj981Rl/fYU2VdvBTp8l+3ed
         vFsg==
X-Gm-Message-State: AOJu0YzY/O0RrHKRLc8l+9nRDdRf5we/PMq69p0jvmlsjBOzPaVdI5CO
	fdJ5ksw5kavatjsZnS+vEW4RczPBbSWbGFNK6qwmp8ztrFlKrQRlSI6N6wD2L1BBTAd+as86EpB
	S0Wo=
X-Gm-Gg: ATEYQzyPjRS5gdYpAyQPj5t4SVUFCTgUU3UrndalYt0YMgmZcUDrhGgYBzumkHyGhUP
	HiDo7a1yfv1iHvFHFcEn1f/ZO9O9FpRr1qkKsGPj4ay+AKEKTOz0BEqxXCTMHeKT4DNUhVv85h7
	uOHv+qjmAvKGagBs49havy4pFyzzzUu0OXY+CYFjeS2xFsHjEPZJlZujKzKocdmCNvCwQblBuFk
	NKfg/V1Th1Jh6Do1L4kBgb74Rer5wzNOv8CCzn+n3MUCHTLPZUlreG7hX5P6CoVIiqitOWIxmPL
	1hbjnsBRLhaAmsUFrXWU4hRvrvWH+sFyR6HG+j4JA3OODuqmrtp3mn4rviHmsTAXHqAy0SIIJiY
	5KvSIQDPtYU2rRRg2uXgASQWMVVPEnD425VD3zY86IHAMXbh0YykfYYrPjlzVbJth7cjfJ9oy+N
	mkwzvbZGw9qPAY
X-Received: by 2002:ac8:5846:0:b0:506:a75b:2603 with SMTP id d75a77b69052e-50744434047mr104100441cf.34.1772218850511;
        Fri, 27 Feb 2026 11:00:50 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716e105sm45607936d6.18.2026.02.27.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:00:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Arthur Cassegrain <arthur.cassegrain@arm.com>
Subject: Re: [PATCH 0/3] arm/[tf-m|trusted-services]: rework dependencies clone to enable devtool
Date: Fri, 27 Feb 2026 14:00:37 -0500
Message-Id: <177221883995.575698.11817472031742736616.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
References: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 19:00:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6925


On Thu, 26 Feb 2026 11:53:09 +0100, Arthur Cassegrain wrote:
> For both tfm and trusted-services, clone all dependencies into the
> source tree instead of ${UNPACKDIR}.
> This aligns the layout with devtool git-submodule handling, ensuring the
> recipe sees a consistent source tree at build time.
> 
> tf-m:
>  - move dependencies sources to ${S}/external, it allows dependencies to be
> patched via devtool in the same way as the main tf-m repository.
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-firmware-m: clone dependencies under tfm source tree
      commit: f0cd8c56d2fefc6bd01a967d56bc03198658766a
[2/3] arm-bsp/trusted-firmware-m: fix psa-adac patch paths for corstone1000
      commit: d5b265ecfdb3edc714cf474639caa9384636b515
[3/3] arm/trusted-services: clone dependencies under ts source tree
      commit: be64772664b056716aebdf8b679c3b95d9a6b6e8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

