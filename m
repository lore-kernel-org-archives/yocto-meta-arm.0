Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FCEC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:38:11 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.17145.1710337084365813633
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lBJymn22;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.177, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c1ea59cf81so519188b6e.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710337083; x=1710941883; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUtAyAluz6jSsZPuuFt3wr7h4E99fLtli6x4mbgaVZc=;
        b=lBJymn22zWDMlmXus4frFKwLaeb7UFgYI7bzDaoRgL2lLeS3UvkOiMUczbY8yzzj23
         pqSA0fIG+YjKnE93XBBoECyIZwA23YFEcl7ISoPBuvOKp/JWvcXHvKAOx6xiJkCAyuqN
         IVORkmiBtErk5VU/4sTBd6Wa45ASjYAF7OWvYwH3M2tnQXNzrXxiZiK7f3xN7XkXHef6
         XqT1JWJpfjOzdNk1H5Xy+ikqZPFbINm3F/KWv17cj/h2yqc1D2MQi7A86yFWAxTPT+m2
         2jTbkqIR5Eb2pIL4RSrW96ogHIM0WhknmfH9avaIYYtprpk7XtGJZ7gQzZBp8yQ4uWZ4
         rffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710337083; x=1710941883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUtAyAluz6jSsZPuuFt3wr7h4E99fLtli6x4mbgaVZc=;
        b=B7p5kdJrCUa9RnDBAb6xL1iKEldzrskDY/ovQxJEEF+9ZerAYYAcp/CVCp8r5dBDBK
         w4g1jjhXJk5Ab5MuRYxlqSssDbIxv2ftislewzhOYdGX7XTy8FofPWD25zBgibMP+NNS
         GZjM63/syF0gxIQJh54kgCMN4k6UrjLb/euJ9hyNylq6HDGopkHoQei0MEYo+XVWHHNg
         liMLgQpzJ+Izyv1knwSrzwGDPdoaF8Ku+pJ6qbbv4oO4kJPQHDRcaTvAFWiRm3SbGJeh
         lCCIy/bZnIHzAkTxuR+nQm/wpzUWQfVMiGKaAMBEAkttIIRKqecrsMoI+sFykDDaUb2s
         t0dg==
X-Gm-Message-State: AOJu0YxzRWuTfRmAugqsjVAyVRvli+nNUucP7g0NLsryeU0DazT+56tX
	wWTv1V5V8QpzELwitSzapwY5o09bzyq8lujyLOsU64hpBlLxSVWMYPiEmYh32eXJz5/m8yti2BX
	nJg==
X-Google-Smtp-Source: AGHT+IHndbiW+voOgnmEZx6q9vw+G+A00gEnheCXQS3KFDWLxpeqBiLFEC6XT8BlRCLvt9J26Azacw==
X-Received: by 2002:a05:6808:1205:b0:3c2:1ca2:ad70 with SMTP id a5-20020a056808120500b003c21ca2ad70mr7228503oil.31.1710337083619;
        Wed, 13 Mar 2024 06:38:03 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id s9-20020ac85ec9000000b0042ef4b5f4fbsm4852859qtx.38.2024.03.13.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:38:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	delane.brandy@arm.com
Subject: Re: [PATCH 0/2] Upgrade corstone1000 to TF-A v2.10
Date: Wed, 13 Mar 2024 09:37:11 -0400
Message-Id: <171033703275.1772326.7563391632297993898.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240306105015.2630056-1-delane.brandy@arm.com>
References: <20240306105015.2630056-1-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:38:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5427


On Wed, 06 Mar 2024 10:50:13 +0000, delane.brandy@arm.com wrote:
> From: Delane Brandy <delane.brandy@arm.com>
> 
> Upgrade corstone1000 to TF-A v2.10, removing stale
> Corstone-1000 patches from TF-A, add fixes to boot TF-A 2.10.
> 
> Delane Brandy (1):
>   arm/trusted-firmware-a: fix mbedTLS version
> 
> [...]

Applied, thanks!

[1/2] arm/trusted-firmware-a: fix mbedTLS version
      commit: 697fcf439485020f3757bd7160577675acfdf34b
[2/2] arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.10
      commit: f6f616c38d2d3134a3c6c373f4fba70e1d9e3015

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

