Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9469C6FA8B
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:10:14 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.6727.1663164606105192970
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=KgTX412k;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id w4so11816405qvp.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Bz7jNrO3BZ8dQhw+0SIKTunrgmoOI+0PIy3qPj0gduc=;
        b=KgTX412kqCNNfV4/kty8OyZd8H/lM6KD7dK4jhydgnrBetOd0s7ldtfy19uqahejjJ
         u1ifBEw7gk9p3S4qiRwtFzhW7n7vuTxygik52c5++Q7/6fd5RWeE6wDz1FWSJVcMUZDT
         Jqo+HInfjlYUn4WHuqhmOfXl1wL6+eyTxxxfxAiRbNq5qxYOsH/DXHgRoTdOMw73qqp6
         YKcG5kpuO3LLKoIXm4VOHm0QgzDQVFQYokTbMw2GwHALzR5Eswnp8PygYriRPCLPnOQe
         /TrMRi3VaToD+XZChkoMp1GUhV3kmOCNnIMwCfbUTy4r2Ae71TihDTXmy8kEqRu3J2o8
         /u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Bz7jNrO3BZ8dQhw+0SIKTunrgmoOI+0PIy3qPj0gduc=;
        b=jBgZyuhmpr9GU3FR9OSU3t92h3ERo9qKWkzow2wtXhikjiQzVVMDqCXYFblD7Tn8qs
         xT0AcB9soMvR/Xe2dtr8Bm4y7l7J8VzJWMlkQNE3/O9JiQ+WFQaEOauwN4FpDB9UczMA
         s799gNlq3Damb4leCt+zfaiX/J1p319tnmpOw7MSPEIdOvh7Dr5zRLFyk+Xc+KJj2G4t
         sRVaVdm30yuU+hukR1xPl0DlRfJVIlELCi2+h6bMiNVvwEk1ljejrN4GfKL12jqpdJE/
         BO6tDwbyZVeqYBA/5SMerNGGMlmDZjBr6KYGJ4uUMog5UGYGyZ2q+LdSil/K+NGuu+Ja
         ADmA==
X-Gm-Message-State: ACgBeo3o0lqpX2VrnGqv98TD2c/+2SWT+XLv8NjCF3Vpyr2e2/yr9G+9
	m7DJgPlodQq725AHFUMAj62FYr9i2X2poQ==
X-Google-Smtp-Source: 
 AA6agR6im1tr05KheqZ8IYxoP6iPk/hzwYhiyaAZX2wh1tVSPsnSgh4x7Bx4TuFSBicEbTY+LyvUUw==
X-Received: by 2002:a0c:8d09:0:b0:4ac:6f1b:3a13 with SMTP id
 r9-20020a0c8d09000000b004ac6f1b3a13mr29107628qvb.98.1663164604658;
        Wed, 14 Sep 2022 07:10:04 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c18-20020a379a12000000b006b8d1914504sm1887832qke.22.2022.09.14.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:10:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm/lib: Specify the FVP environment variables explicitly
Date: Wed, 14 Sep 2022 10:09:32 -0400
Message-Id: <166316457281.1963578.4279031015069322731.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909121206.3098601-1-peter.hoyes@arm.com>
References: <20220909121206.3098601-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:10:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3782

On Fri, 9 Sep 2022 13:12:06 +0100, Peter Hoyes wrote:
> It is sometimes useful to be able to configure the behavior of FVPs
> using environment variables, e.g. for licensing or plugins.
> 
> Add a new FVP option: FVP_ENV_PASSTHROUGH, which allows the Bitbake
> variables to be passed to the environment to be specified explicitly (in
> a similar way to BB_ENV_PASSTHROUGH). This ensures that:
> 
> [...]

Applied, thanks!

[1/1] arm/lib: Specify the FVP environment variables explicitly
      commit: 820a55d348bab5d1953a6f1386383139772372fe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

