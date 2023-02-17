Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2FDC64ED6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:31 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.259.1676608281540301427
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ec7lkLtR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id f10so4386068qtv.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO0G3x0BRUwvRbwU7E9iDcnKADGk/7F2cZYe1c2ioe0=;
        b=ec7lkLtRt7FM0uqG04+oY0Wv2GMDJHs1+VtA+DHzO47PgBZomFkiCFwGTHQ+vnfaoz
         A05JB0UC+ss7ms98ErvBQPYx/8x2h5T0ELvi7qYKw/jnl/Gx/hF4341vgJAfz6IoN8Cl
         KLW71TBRzCfRjqWW7I6Ktx/ML8kI09ms8eCiZydoVbiPSldqWCJ3fQnu3G0E6Bndlvms
         xX0v1aAOscjksOCu8gSh7qxwPG1YDWnVOsm1vyQ0v32qaxAryVR+iuURuuoPHyGkOrV+
         Kr1emM6xSd0+Zb54Lp3Gmv13iXRqg1Me07O+5z+h9Qn73gAcBnfq4xJa/yvdNbCDST93
         ZaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO0G3x0BRUwvRbwU7E9iDcnKADGk/7F2cZYe1c2ioe0=;
        b=QTiASZ2rqGmHvBp+vnXxtvN2KN2U4Y4YJi1Vt4G/6780OwdZdCxRyDRPqW5wx+kDg9
         xECZpNkrRA50J68jC0pquTQBG7hmuYmy/Qwo1Q9IVsTSmJ6VKkqJ9zpSeNEwh2cPtDmt
         tZf3VQHq+cNCbqWQWgYHpB1+Igo0jW0am6RrUTQz3IOXRL920SZ5uDd9CLpmMTvf+mst
         oCsvEEbwEE72bnu3E9EmzLhk8Miz+1R2DmHCJxqNGXBgOc0HyljFOuWUg7aXdCEiPI5w
         eEQ8OCJt7AdCPuO0JVp6ZyAqefmUBglC75I2ZzcVU6m669NSEzgD+iYkDs7w7TUvgTMp
         8c+Q==
X-Gm-Message-State: AO0yUKU/xcFjfj1c8mVIY8NWDokJKnIb+lqbfzYs7J3OPfDALZ2UVVmd
	S/jt9IxWetyfEEK8tiI+6mu3t7kTR5wSEt2E
X-Google-Smtp-Source: AK7set8gO98MSsTwmZfxRGw3TM+UOVCHODWnX7oA5FVH+/EcJLDSvJ7U4YAVj0+ZVe/fnFS9Gtq/lQ==
X-Received: by 2002:a05:622a:1a0e:b0:3b9:a4ac:9109 with SMTP id f14-20020a05622a1a0e00b003b9a4ac9109mr203554qtb.64.1676608287969;
        Thu, 16 Feb 2023 20:31:27 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id q13-20020a05620a024d00b006f9ddaaf01esm2530010qkn.102.2023.02.16.20.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/external-system: fix the gen_module race, again
Date: Thu, 16 Feb 2023 23:30:58 -0500
Message-Id: <167660825902.685488.7098382567956346739.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208113853.1966445-1-ross.burton@arm.com>
References: <20230208113853.1966445-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4421

On Wed, 8 Feb 2023 11:38:53 +0000, Ross Burton wrote:
> Apply the patch from scp-firmware to the third copy of the buggy
> Makefiles which fail randomly under parallel builds.

Applied, thanks!

[1/1] arm-bsp/external-system: fix the gen_module race, again
      commit: 0d7489a0552bd83a1cc9f2669dfa458a66924217

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

