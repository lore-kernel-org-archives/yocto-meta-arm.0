Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF0DC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 20:58:54 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.3451.1642453133531640968
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 12:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rS2ulzLu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id v7so20373290qtw.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 12:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbYsBlwIvh7GNS7Jg0puY/N2yA4Sj4JpH7sL1CHxsw0=;
        b=rS2ulzLuGC+aAaEqhWgxGCvpO5ZWfIiGojI4WLmkbaNbWP/gmni3zNlbGG/sNZ5OHI
         ciQTkV7sEhNwRqPv23MBwd07S+MIx9lQYF/dYjgGr0LKetErGaOqCz/MS6+KJuWl/19k
         dmNA4Iir2Z/WrZy5gjVjyynlu6xfo9sNAJO30MGibpcxj/gFXzwPLO0HMAsGh3WBFOxF
         dUgTEU6+ZMYZ2hAg869Ak31g0T8ZVB2850DpSwIiVutBXt2jEZ9lYCWma4dJGkx+j1EV
         pdtsJvGl380XN2iD15QLkNyO2DFo6eCjx8wsKYiOCbPqehEKlnSD+9c4/nuVs6drYn1s
         spEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbYsBlwIvh7GNS7Jg0puY/N2yA4Sj4JpH7sL1CHxsw0=;
        b=7tOHrfMbYVd1dSNfLwcupso/uKh6WJdc5y6O4jvMbVDw4AmrrCfa/KvLseNRylsisA
         vvExY9DV6l8dtQnO7Y4f5VEaoKr/mcxDYI7ENW10eIn8z4zoKoGN3eY61Yym6cSXv4Z7
         WJTTtENx0AIvp+FTpSH9ywuaIecoq28lXa5nP/S6zlrzwRPS+GueJJq2OTFGTTXlS6se
         NgRSYA9U6C4nVg2U3mbmBJENTxLGAUyHCt7L90E5L0sGqy16TnrY6RzPzfATuyg/CPGw
         lFf7u6GmZRmJjXxK4naaYmnBuTnIDQKAGERZZfMeiftXkNbD1yMFNsSRGRsqUGN4T6hm
         iDOA==
X-Gm-Message-State: AOAM532t+hLYRHvm49NmlT/nNN6OVS5HLDGEP8Vx5U/qJLqEpTfo/Cmy
	dHABeoiq8a/Ww0zNTIKGbQnWQsQnX2FqAw==
X-Google-Smtp-Source: 
 ABdhPJx0SkCK/yIVlyWRypIE6sGt7skfvEHyon0n3TxFsoIhe9S3xYKtkYgDtxwNSVxxmd80QOxwpw==
X-Received: by 2002:a05:622a:311:: with SMTP id
 q17mr5040377qtw.418.1642453132515;
        Mon, 17 Jan 2022 12:58:52 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:2cae:6277:fdd6:96c4])
        by smtp.gmail.com with ESMTPSA id
 u6sm9616623qko.83.2022.01.17.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 12:58:52 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Diego Sueiro <diego.sueiro@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] meta-arm: Make generic-arm64 kernel cfg based on
 linux-yocto standard kernel type
Date: Mon, 17 Jan 2022 15:54:46 -0500
Message-Id: <164245288788.2965917.9781139536795132835.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <b0f55d0fc4ef33c8b24b658a8829d88646ddaf36.1642172230.git.diego.sueiro@arm.com>
References: 
 <b0f55d0fc4ef33c8b24b658a8829d88646ddaf36.1642172230.git.diego.sueiro@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 20:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2848

On Fri, 14 Jan 2022 14:58:02 +0000, Diego Sueiro wrote:
> By having the generic-arm64 machine using the same kernel config as the
> linux-yocto standard kernel type, application layers can rely on the same base
> configuration, independently of the target machine.
> 
> Also, the kernel-yocto.bbclass searches for .scc files in the FILESEXTRAPATHS.
> Hence, we don't need to list generic-arm64-standard.scc in the SRC_URI.

Applied, thanks!

[1/1] meta-arm: Make generic-arm64 kernel cfg based on linux-yocto standard kernel type
      commit: a70e04d9f86e4f81d288de31eca241e0c28daf96

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

