Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8A0C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:07:17 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.3226.1714529234748358316
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=dxq1460C;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.45, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-47a404c6decso1855567137.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529234; x=1715134034; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBmKknGlqNNHlauto/DHiXQ/Ht3yo4QWJ3DZfM/pfkU=;
        b=dxq1460ClBXvMNdQdtzxsO2mQbWFCOPMDITO0Hi4CteMIcmeg+aJ+2aluK/MQWJNjF
         KENQNw0BNUDu0HIy/lemw6zKwCwwX3AMv+wQZKmpkLDYLHUS7ZLIov/hz5yWgTeQjvnn
         Gs1PnTLQ9g3XfJbaoY79KM7+7cHb3TvTwgKctdMSUB8r7NWlmwFDVjoO+f2tCa4vPWTy
         lFOZgOITULoCr5avfIibi+Pd1u8MwY20XZxogZz6+dyPUFQl1Mv2ElhqxhICUJTa2hTT
         pNr73GG3/90E3C0+csomww9YgxUx06pB2TWHtQ6w8KCJBoLbyee6agMF3mBOkeEuor9C
         EjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529234; x=1715134034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBmKknGlqNNHlauto/DHiXQ/Ht3yo4QWJ3DZfM/pfkU=;
        b=WZCJBQlOFgMHXdAB4BVZG/GGbI2Blfmr5AOjOnqLgTszWrgj6KRNaxs2cWczC3o0zF
         PXc8UB+sP7ip11nWls7+AbPKWEFYoejkC7e1c1AqlqeKT57l5vdaT27PVzEmhauqcs4q
         H+v9kfdctzm/Iuv3EWy7H9QtaPvMVZa4htO3/XYlm6c9gkfsxdjKcK68nbb9ew1u0eLC
         jEPgmZYfORYiPZPMANmwvgs35A3WJ7oah78719CvUYX2UiFArcS5Dli9YNJ0O6xaSPOz
         f51fMZ1/K3Xi82bzjgHX0vmmqUIZAZZO+mbsL3v913o8O/VpEr7ALx5IMYTLN9GEuqOi
         T3Sg==
X-Gm-Message-State: AOJu0YwNH8ggTNwwbSq9UUMwtCJriHrq+xZAR2GV43oHpMFKlt77N/fB
	+pwQyQgkqDHBFFX8sFXCnlPPz6V/kOKOlSENG+3CAvAeqZo4CrTNiEQJBsC0OMSZuBhnMK8Gvkg
	=
X-Google-Smtp-Source: AGHT+IFIZf/1Z80cFBjWdoTprOO9jkHHyyGujo+sujFHOAaIqlPCsUyT9NfNM9uqGDeVDIg1L++vaA==
X-Received: by 2002:a05:6102:1945:b0:47c:5c1b:7676 with SMTP id jl5-20020a056102194500b0047c5c1b7676mr1558715vsb.18.1714529233626;
        Tue, 30 Apr 2024 19:07:13 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id hf24-20020a05622a609800b0043ae36dc25bsm2452922qtb.80.2024.04.30.19.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:07:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/5] Add back U-Boot capsule generation with fixes
Date: Tue, 30 Apr 2024 22:06:53 -0400
Message-Id: <171452921859.3441774.8564503172252346213.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430155924.799192-1-bence.balogh@arm.com>
References: <20240430155924.799192-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5674


On Tue, 30 Apr 2024 17:59:19 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The following commits were reverted because it had a build race
> condition:
>   arm-bsp/corstone1000-flash-firmware-image: add nopt generation
>   arm/uefi_capsule: use U-Boot for capsule generation
>   arm-bsp/documentation: corstone1000: update capsule generation steps
> 
> [...]

Applied, thanks!

[1/5] arm-bsp/corstone1000-flash-firmware-image: add nopt generation
      commit: 3b74bb36fd228b1b6aae57fd885077b2f794cf16
[2/5] arm/uefi_capsule: use U-Boot for capsule generation
      commit: b5b7b8e5237a998cb4b0e8defe8aea382365d4f9
[3/5] arm-bsp/documentation: corstone1000: update capsule generation steps
      commit: aeade01bb71c9730eb5ad8ec1e4ae29ec849daf8
[4/5] arm-bsp/corstone1000-flash-firmware-image: fix capsule dependency issue
      commit: 5d9e53af10799f6a194b36acdfacfdd770d1d801
[5/5] arm-bsp/corstone1000-recovery-image: replace core-image-minimal
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

