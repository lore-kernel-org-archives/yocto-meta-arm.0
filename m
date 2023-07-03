Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B76EEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 22:24:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.46004.1688423037942957817
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jul 2023 15:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=2c7QiJQk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76714d3c3a7so511209585a.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 03 Jul 2023 15:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688423036; x=1691015036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPwWHJ9eUX8t8vMdgXnwnTkgjIrlcadzOxNlnaGRHZw=;
        b=2c7QiJQkIx43RjHcAALojbVCfD/UAKjU917s0K08wL1svyzLUCVLpIV+vBLnPfFAgs
         n5+LP9fZdvVsuHDAN2FNgFYrqt/0yWhMPtXCVHL8lZ7LV6XVCR4xYNsCezMIc8hvYki1
         qqvjwW3oGLjORpJYmnkp5Nk7ePJbNCU25UGF7bvUY5lQdAJCGKtDh2qj2L246qaJ/Gm2
         ZV4hsfErf/Xn0Y/ideZyJwzDgnteQfMos77Udrhs2kFemOOdGrXr5FoRrdEi9vl5+EZP
         D7LQW63HMCOfT2ojw8iBRD435BRCRvD8CMDFPBL55hqgOeXP/JI4R5KtUYdX0z5rUk7a
         qDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688423036; x=1691015036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPwWHJ9eUX8t8vMdgXnwnTkgjIrlcadzOxNlnaGRHZw=;
        b=eop61Q4mD2GLAZSXmwADTFRlIxLwL2FwHyqX/RVtCTlShJxkgKB7UlMSFR7hunriZJ
         j4d49IMu2Fd0/UmKbH6IhEme2ktF8+LzrFfiAprpS7PtGdyyHQVCPS6wpzodvjBabPDE
         mi8EhNqv7xsVZ8/8tfGmT4fYZSfeykO7QAmQVDsUWTyBE8KP5kQSVGB+mFhEJjo9oHUS
         UEww05tBvSesGOsc/aE35LNC7FrydxrDjnfVyUMAqelrNJJxbn1yi3ZW6dZ4WE1lno74
         ucU86TRBBaFRkyHoV9r0X4g02vkYT/KNGN1UBY7RQelON6doHGZ07tfgRb3ghyRvlSOb
         SYhw==
X-Gm-Message-State: AC+VfDw8+d0i1noG8BaHCjSKeyZUjBwqtd7j/KWdhIZOh+iBESWgJYUE
	y2UOKfDR7j8ozaWLrxWUJXCeOSM/kACr/rJ2RtI=
X-Google-Smtp-Source: ACHHUZ4NTSTSGMGxq5FLAiznS0uVTUrCvGffHPitxtQSitHHFLfOQW42EzlGHLtdbFntTgyVhJl80w==
X-Received: by 2002:a05:620a:254d:b0:760:7730:cd4a with SMTP id s13-20020a05620a254d00b007607730cd4amr12867997qko.21.1688423036670;
        Mon, 03 Jul 2023 15:23:56 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g13-20020a37e20d000000b00767721aebc0sm994599qki.32.2023.07.03.15.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 15:23:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: Re: [PATCH 1/3] optee-os: add optional optee-os-ta package
Date: Mon,  3 Jul 2023 18:23:45 -0400
Message-Id: <168842302536.3607005.5932740229771290819.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230630112340.3314395-1-r.czerwinski@pengutronix.de>
References: <20230630112340.3314395-1-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Jul 2023 22:24:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4851

On Fri, 30 Jun 2023 13:23:39 +0200, Rouven Czerwinski wrote:
> The optee-os compilation provides not only the core files, TAs are also
> usually build. Create a separate package which contains them, so they
> can be installed.

Applied, thanks!

[1/3] optee-os: add optional optee-os-ta package
      commit: 2b15d78915f46f16171d914ae67f66d5d755144f
[2/3] optee-os: deploy ta elf files
      commit: 4d7d11cf240bfbe457165615bd2066118f614b98
[3/3] optee-test: add TA elfs to deploydir
      commit: 0dfd5d1f3c6b0d31fe3357ff6dbe24bf9365bb9f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

