Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF95C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:08:07 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.3207.1714529280761073525
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nfA6PVvu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f103d9f64so30351685a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529279; x=1715134079; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug+4/UY8JTUbH25lahq/m+GTqZhiNfPjg/uwoEzEOtI=;
        b=nfA6PVvuufOCnqqzUOHnHLKBSXZv+dF2wEzcbNg3XCrLFGlWwmnwgD/O3IMR+Id4pH
         F0WvLGdamg1sH+dVse5TiESDCiPO/mFeOSGsYwB5nS9U88W/JDDFVZgR/ruCQRwD/7gs
         JNxTugy/3szG5W2zm7kIx9oQOnJORqHWhwh9sAZbTN+ehqoJ4JFtpIrm7AsZXuk2hIdn
         y5/H+ZIe7qKR8QkNarY1oVrNxhzcyQvnTXyV2ksSrxowp6grbsyBOeULitDvywz3okMJ
         GwrJzJa+fVg+dZ+RbAvqRKM+pOp9x+I1U6NSBE2b9UfmDvGz0FrCT3k0XnfcnOMv5d97
         y7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529279; x=1715134079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug+4/UY8JTUbH25lahq/m+GTqZhiNfPjg/uwoEzEOtI=;
        b=bR1SrSLHB7bKkKJXl+8oCb59WLWy0OtFxDBYp+xnmCR01KtbyoWOCeRkJqDhXETuvJ
         bVeX7iDRYLUoNMbeoHXfxLj11lnmcKqw00rwsb8XVfpb2PcGRoXMjvD+okOnBIaLq8lk
         e9LmawiP8UbSYoMwPbi1aw4Ju1zRc+x3u98vB9eOiqkf/D3bMaS0ffCfi0Ge7snBYcQi
         oMgpGkAbN9/Xy+3s1raOZn4RGKCt8u7B3at0eT09KUbMvddK2xjxoW6qCtfHCs+Lvgqh
         1jDRpQELCOcOhlVc498iWGMbD9roaOyTMa45aSkVIdaUxRDQRxbwmma88QZMSZIxOfOT
         ZKSQ==
X-Gm-Message-State: AOJu0Yw0sNSKov2SUxMpnqY1aT6L5jLf2F54AMT68RizuTUKPmGzeHs9
	yJoALOsbJMbWe83SCoihEHLnIqa3o7CUfw07xRMxFBtz3OT7dExeX33zToWrwjCUKjtTTBag8zU
	=
X-Google-Smtp-Source: AGHT+IHVAK8kkTcXh3OtRnKKSxArpjHTduxXJylEHs67acuSDLQauwFsu6KBTUoEPjnWE8nS09l21w==
X-Received: by 2002:a05:620a:1913:b0:790:92bc:7a57 with SMTP id bj19-20020a05620a191300b0079092bc7a57mr7620591qkb.36.1714529279544;
        Tue, 30 Apr 2024 19:07:59 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id t23-20020ac865d7000000b00437794a29aesm11882286qto.71.2024.04.30.19.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:07:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH v2 0/6] TPM and fTPM test
Date: Tue, 30 Apr 2024 22:06:57 -0400
Message-Id: <171452921856.3441774.15631772398902335029.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5677


On Tue, 30 Apr 2024 15:37:26 +0300, Mikko Rapeli wrote:
> v1: https://lists.yoctoproject.org/g/meta-arm/topic/105574754
> 
> v2: Dropped "optee-ftpm: enumerate also without tee-supplicant" since it
>     depends on not-yet-merged kernel and optee patches. Added optee and
>     ftpm tests which now pass on qemuarm-secureboot and
>     qemuarm64-secureboot machines.
> 
> [...]

Applied, thanks!

[1/6] trusted-firmware-a: continue if TPM device is missing
      commit: 0923cc8a20a2ef87c57a560dc8ab884d90bf9c1f
[2/6] optee-os: inrease heap size with fTPM
      commit: 1dad884ac002a1e24cc62ef02a43315c3aee01be
[3/6] oeqa runtime: add optee.py test
      commit: d4507866677c3d32d5b862de141b36c26f275ee8
[4/6] oeqa runtime: add ftpm.py test
      commit: ba315f7242e0edb103c1fd836014789fe8cf938e
[5/6] ci/qemuarm64-secureboot.yml: install optee and test both optee and ftpm
      commit: 70e7f64af6cb71009163eddf7161f29bc9f6e618
[6/6] ci/qemuarm-secureboot.yml: install optee and test both optee and ftpm
      commit: c43f173276957ba43f8aba892e7e531eeed20afe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

