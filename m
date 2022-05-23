Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB0BC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:03:05 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.29926.1653325383781749087
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=XGMMadoW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id 14so7112868qkl.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFpFlJnONzMj2Q+ztX9G4NnII8A49X0IbcrPKAr0BdM=;
        b=XGMMadoWYWrdsyKlbCEkxgFAn80h4euA1qYYVcMVqG+6WTR/F699fJWveDm9LEWJwn
         E2N8xcYJem9fMXQIVoVVeBGE7eHkySxzostRIbx1lvmRwxssuBysiefAwRrdtkFslZwT
         /1Nbxv//tRp6UiCZyh92q+XP2GRotgtSI+PHbHirih1jcggfiXQTR8AYWRGyKjDqJUzJ
         qcOey1nBSu2vB9a1UbGIjBsAbQa5GuE6IplJNabPl2cAiPxa4lLBZnjsoAOVq2vSv+RE
         gjfig/jnkW2Mfmy39Jx+2P0UdNA53XgKunYGKFR4G8eyR/CqKVE4jaVoGs6aaF7NzTpT
         /L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFpFlJnONzMj2Q+ztX9G4NnII8A49X0IbcrPKAr0BdM=;
        b=ObXs5EuhQ9ugrra5ubQOm0wmKqkuFHbCx/KJCOPVnTmTiNp5apFQviZdMheae4bC7X
         mnIuoB8yYxKpGPcENQOgqA8yPO/FHccHD7Wo9kwn4JLp/yBRxQLDz2A0X+MDTwbOR90Y
         4DXBSz6SiGJq0v+66BHLVv7kmVqrwXvhNlM3je2mjzEkzZo8UfACVWk9couhY04nwAf3
         sKA5E0oPAqQgK0O09FHjedmcxFMMRnqktVZsmciGhVARfvRowlI5d2jkZpeNt1pMX1g3
         +TLFYO/z6dI3XnJcU8RBsswP20Bj3Nwl1Hk2xVyXbo0FrWZ8K5838hCjeW8MFVoKcws+
         wT5w==
X-Gm-Message-State: AOAM531D5DBa8dXx9Lgoxh4BD3hQoeY+K1dzWYza/3+E3tKg0x/8RgFw
	GzrGC7VGqaUuNKETqET40DKFKAf6z/2oLoIQ
X-Google-Smtp-Source: 
 ABdhPJzEc5dzZFpHJKZz4N83YHWGWXdt9hf6x/lrvt7xelcqocmzatHGYpReoTG1FpIG9XlGzoJ0mg==
X-Received: by 2002:a37:a344:0:b0:6a3:3dd3:4168 with SMTP id
 m65-20020a37a344000000b006a33dd34168mr12408726qke.445.1653325378156;
        Mon, 23 May 2022 10:02:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 p19-20020a05620a133300b0069fc13ce1e3sm4558005qkj.20.2022.05.23.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:02:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: sumit.garg@linaro.org
Subject: Re: [PATCH 1/3] CI: remove preferred version from external-gccarm
Date: Mon, 23 May 2022 13:02:46 -0400
Message-Id: <165332536667.1082672.4981509280253811972.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518112051.3470898-1-ross.burton@arm.com>
References: <20220518112051.3470898-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 17:03:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3461

On Wed, 18 May 2022 12:20:49 +0100, Ross Burton wrote:
> I misunderstood how the external-arm-toolchain recipes were working, the
> latest revision of the recipe works with both 10.3 and 11.2.
> 
> Clean up my mess by dropping the PREFERRED_VERSION from the CI, and revert
> the addition of versioned recipes.  Simply using the right tarball is
> sufficient.
> 
> [...]

Applied, thanks!

[1/3] CI: remove preferred version from external-gccarm
      commit: 047d2b391cf88cd9969860d26ac459e01a69822c
[2/3] Revert "arm-toolchain/external-arm-toolchain: add back 10.3"
      commit: 16fe716dc60ddcd9885e8b68a3661dfe94ed35d9
[3/3] Revert "arm-toolchain/external-arm-toolchain: set the version in the recipe"
      commit: a52f85a2af9d40874bd6a511665830eda76641bf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

