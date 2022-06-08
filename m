Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FD7C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:59:38 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.6018.1654693170491231634
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 05:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=dCRou61p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id j2so14376245qvp.9
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AnYaxziD7i1LYGrCcMcOpYFXgWBj3hSzlJHrY5kQEvQ=;
        b=dCRou61piAd2kG1SqNm2FU1Tvdr6MVjbmSN5tY9fgMvz5CkwHIzjdiy+EK6IGtpU/c
         2QW+UI6L//JKYJkoTLRjEqyLktCBMb59219vaDJthBTxpMgYRQpQl47gPXVFjpDXS7vz
         9jIJ2OkQxgtP6gBeLy6YINK4tfUxfXg6m7HR22R40Ox04HAvuD0qNHw85RhJSaMTK8g5
         U34StMiyVDF60l4fYYgoQ4tHKDNpaa5snztut3njnqDD2kAkmWnnRiknh55zYpSC29sk
         h/pBvEyrhKYWsYsTwsiO5IWeQjhTZL3cPININOVQizJnvker2YAoenycXvvTx98ws/0g
         pSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AnYaxziD7i1LYGrCcMcOpYFXgWBj3hSzlJHrY5kQEvQ=;
        b=6SIJaZOLPW+3rhHlf6ZsDEVB3DYY5dSH8+OGS44W/a7CdaGwhG15DnScADe7IgPfbk
         dcYWc9TwLo6+Rg17LRo6Bj4OEzp05V8QMLei8gFpzsaElfebwdFuDIavhBOljExx9p+e
         reHClJq2vSTSRpvsvf2k6h32lqmLT2lp6Vp1aMN9oK0n7PFjUzFDYUDosk6YVCuY+LNV
         Qrwh1lHZlwIv85/9ydjxphf6eVarrrZDmIDuBpKR8lDSOHt9jXL6+OMA6ddIdTZ37bke
         6t9NOwxbNaKUVnRj27IdB4tuc5TVmMx/TpUqWBQ8t5szURhTbc8D+QcZTwsrq90HZDyF
         vZGA==
X-Gm-Message-State: AOAM5334p9MSatfEGA39y3vbsnfWmkfeWwEuVYEDX12UycTF2dhBMHEb
	ALc0yZzlC+mUjTEUXNHBiG3EePpJwpcBXA==
X-Google-Smtp-Source: 
 ABdhPJxBvUcE/N6amQfsfG8NlUiKJ9zyohAXhgemdcdlFih3mdzPB8YUtjOLBIRTR3jJHObHuwCCew==
X-Received: by 2002:ad4:5744:0:b0:464:52f2:c2d9 with SMTP id
 q4-20020ad45744000000b0046452f2c2d9mr37366854qvx.95.1654693169415;
        Wed, 08 Jun 2022 05:59:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bp13-20020a05620a458d00b006a6bfcd6df5sm7368053qkb.37.2022.06.08.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:59:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com,
	robbie.cao@arm.com
Subject: Re: [PATCH 1/3] arm-bsp/u-boot: Update fvp-baser-aemv8r64 patches for
 v2022.04
Date: Wed,  8 Jun 2022 08:59:17 -0400
Message-Id: <165469315859.3617056.15897418196499967915.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220607080807.976725-1-peter.hoyes@arm.com>
References: <20220607080807.976725-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 12:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3487

On Tue, 7 Jun 2022 09:08:05 +0100, Peter Hoyes wrote:
> The backports are now merged, so remove patches 1 through 5 and
> renumber.
> 
> Upstream now requires CONFIG_DEFAULT_DEVICE_TREE to be defined, even if
> unused, so backport relevant portions of upstream BASER_FVP patch into
> the board suppport patch.

Applied, thanks!

[1/3] arm-bsp/u-boot: Update fvp-baser-aemv8r64 patches for v2022.04
      (no commit info)
[2/3] arm-bsp/u-boot: fvp-baser-aemv8r64 cache_state_modelled fixes
      commit: dd8b6c1dbe02666a2d4e372dabf832dbfc2977c8
[3/3] arm-bsp/conf: fvp-baser-aemv8r64 model parameter update
      commit: a8cb33d5139e30b4a643da9a277487299c0e658f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

