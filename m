Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375D2CD343B
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 13:19:16 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18125.1778073550897100201
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2026 06:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=b1IwRedM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5102582e237so50297921cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2026 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1778073549; x=1778678349; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXQEL1JdD6a0EdA4CXOGNnapQlsRTjnqU5FWdqODe6c=;
        b=b1IwRedM+vTYU+AT4UAZP6sQAGhJOWuw2E6q8cB4LwIC1NiPFd126BCz/3xIfFdQLg
         pc7uakwcdVrl538aPbc70upUjk0ZLofnw5DTT2DnbkftwgDxrksHHC1KbPP495rxhoAJ
         NR7v7cv1fQXf6weWD4ICQD0AnV78rBQmI+Qv8mHTKrj0TWPPaIUaHlipWcjVSFexdnk+
         0gpFFkVAhVplmE4DqUlzT88VpR/hJTRfnOACOH7/TiqDunPiriVdr0WZfUKWLFW6iajG
         n8P4htyDkq1+aHkGNEtkVSWw8NtzNyEeWIV/oX4Xo2kMDatRl5eBLs+QVkRFR+xNYTFO
         X9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073549; x=1778678349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bXQEL1JdD6a0EdA4CXOGNnapQlsRTjnqU5FWdqODe6c=;
        b=Ld2lGIaCacsNbgzC+ANSvVGWnylfxvxuleVJzlCu2I9e2qC93xiJpzynEMFqMVx0y3
         7HePjBGq1083PcrZSmxL0uBuQoHNPxFxzODGF59ubef2Mcu3XQLU18h8ISiIunwjHZWA
         UyX81KzIS7Cq4ddPvSavR7Ty0UKAsNozBDy83uRDTI8yjbF3dZMuz0F3i/Jkb7Vqd4R6
         XHMq4v+uUv2LYSupETgTgpxtf2AkY7J8JToxbsgS2JfGshkvxu53YYz/FTOHrfsUP45h
         dFqA5Q9NL8WHhhYWHs56mcMTifwMxGVyccTyDl6/ZvCfVRsYbZI7h+04f9WgbNVoXnYN
         89Bw==
X-Gm-Message-State: AOJu0Ywk5NXgRhd8VtRkb15yZ+6872c1QratxV4O005DxNpkqC+bnxpr
	b2sB/Tc9prrmfas5fSTp/zKxNK+YvlnSbwVhZwQSoYjXMNCAo/DwnCcwC4gEzc+3uoEMLqAJNQj
	9WgA=
X-Gm-Gg: AeBDietaY4L1i7DG9rRCJuKzk3VEAVM2Kj3C8oRifTR4DRQ+v7orpdiB+31k2I5ed3O
	j4cud9FAve4QxW6nMLk7Eds55v6uRil/1JawZITuHj2H3T63IW9hTyVMdYOqJdU8C6ECBgDtKOJ
	UgFDQ9TxNcH9AjWKWczBcBC4r/rWpy2I1uqWGkNFP8WODtGpHb1V15KgjDBJAFusjZ7riZTt2x3
	PDfEpEitnupsBF9UlzDJ4WR/kt9HYqW8DXjI6fiUyX9E/gGjmq/6lX3QitC3uqUNstPD1kLqNLC
	AbDtTXiLWtXe0czh53vCjS68JZBHIZCNV0jrArrlHi7oXlS1VhYd8m9/unMFJbXo/TQkzngcJyf
	iB9gJ6ULYvYQz9+GdpPqrPuOtM93BKxT1fNRJkc9pB2YhQS8frubD+Am1NtPYG3Q42BPFQQhKPn
	8kl4r6klsnvTUR2I4rTJEXzNc=
X-Received: by 2002:a05:622a:4d95:b0:50b:404a:746e with SMTP id d75a77b69052e-51461fd245dmr47112821cf.47.1778073549279;
        Wed, 06 May 2026 06:19:09 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b353a3sm153148531cf.15.2026.05.06.06.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:19:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Alex Chapman <alex.chapman@arm.com>
Subject: Re: [PATCH 0/2] Reduce sudo dependency in OOB tests
Date: Wed,  6 May 2026 09:18:35 -0400
Message-Id: <177807351611.2898217.11906580254241330016.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260501133017.2820317-1-alex.chapman@arm.com>
References: <20260501133017.2820317-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2026 13:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7036


On Fri, 01 May 2026 14:30:15 +0100, Alex Chapman wrote:
> Remove unnecessary sudo dependencies from OOB tests.
> Fix path mistake in secure boot script path.
> 
> Alex Chapman (2):
>   arm-bsp/docs:corstone1000: Fix secure boot script path
>   arm-bsp/docs:corstone1000: Reduce sudo dependency in OOB tests
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/docs:corstone1000: Fix secure boot script path
      commit: 85bd24f7b0159a089e77b264ffc5d79da92d4424
[2/2] arm-bsp/docs:corstone1000: Reduce sudo dependency in OOB tests
      commit: 3aa085566e4064fbf165ee7234190043220ccb2c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

