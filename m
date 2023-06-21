Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCF3EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 04:09:04 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.3715.1687320541630565529
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 21:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=ug2ByofZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63008f9293dso37668976d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1687320540; x=1689912540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPr1AbFrpOdO7k9NoxkVF9bjGeN9nBdglP+eIWcoQL8=;
        b=ug2ByofZ1ew+mSv4Voh6Vdse+9IAwFjxoJOWyPfKHdCP2N20qTP3ENQQUQntvNfv6o
         lV8B/509IFuvcU9lIsKMlLds9R64Ei9uM9D8zUPIripE4WuZ5zJxWHr5wmm2SPxJyQqV
         +M09mZIj6CBRAluCn4W13dJgW8yrzBhtOaJ/EV055xFWW4mz8VizVfRlp9Q+jZMpq/nZ
         XHDZ1knrFl/ohbhKSXcMY7uiud4fLO2kqUO4hWKTVW805HJ+ufqSAX4mqi6LI/2+evEJ
         kRZJ/qegRA+kBKHUh0wfs22fK37LYKYxQXh+YtCKqw6za31CHU4mIEckhm4CSLLLjYrh
         Q1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687320540; x=1689912540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPr1AbFrpOdO7k9NoxkVF9bjGeN9nBdglP+eIWcoQL8=;
        b=UKCYMb8h1sfLcX6fH5mmzXc2zw4u3+rCHfMWB7ju4uKMk58RGp4flAYRaSorsn0M52
         ODeOBkimI3qENEvYYwETnKCwq0Wyw4hdPotyDIj6W4rgsHX3zcHkom1YV90K+T/jemXT
         KnaVLO3YE8KJbnhe3g2knFUrknVwRCDIKONZlaMotS2ECdGPTy4zLwOyPqdVL/cAfqGM
         Gb3Rq5duHEHMO10cVTcRDRm8nyfz543wkgt7lbBfM+fvi88cWskrdwIcNDHTrPTJNUqi
         Hb3gbinR9cibSlFO2Ag92ULbyoYxpLmHtF1sEkH0Gfhrsw8Xp0wxVrbfo50eX3pYx9ix
         1SNw==
X-Gm-Message-State: AC+VfDzdfzJxeWIsVQT7hEYn1ZkDpYxztjCv+pEwUTkCygBcp0fd0MaZ
	DWBFeMnea3TCMlNASwQEEH6KN6sMAUaRwsUfe/o=
X-Google-Smtp-Source: ACHHUZ7XzSm6w0kVBIerZCXLWVEQgBS9+bO7YA2DbOAxCjVI9/e7QS5qf3E6SWV6ygvHJXrbV0VEtA==
X-Received: by 2002:a05:6214:764:b0:62d:e913:f9ae with SMTP id f4-20020a056214076400b0062de913f9aemr16309820qvz.1.1687320540433;
        Tue, 20 Jun 2023 21:09:00 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b8-20020a0cf048000000b006238c9d051fsm2000787qvl.97.2023.06.20.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 21:09:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Sumit Garg <sumit.garg@linaro.org>
Cc: Jesus.JimenezSanchez@verifone.com,
	Ross.Burton@arm.com,
	denis@denix.org
Subject: Re: [PATCH] external-arm-toolchain: Enforce absolute path check
Date: Wed, 21 Jun 2023 00:08:25 -0400
Message-Id: <168732050505.869555.2874713514985964416.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230620131639.40137-1-sumit.garg@linaro.org>
References: <20230620131639.40137-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jun 2023 04:09:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4812

On Tue, 20 Jun 2023 18:46:39 +0530, Sumit Garg wrote:
> EXTERNAL_TOOLCHAIN variable should provide absolute path to external Arm
> toolchain install directory. So make that absolute path check explicit.

Applied, thanks!

[1/1] external-arm-toolchain: Enforce absolute path check
      commit: e6301496ce84eabaedf3dcddaa63a33ffc26be55

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

