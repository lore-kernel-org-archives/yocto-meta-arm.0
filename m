Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E33C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:38:13 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.25334.1658957884548974369
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PRq1oG9/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id x11so13546675qts.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y7tFSSksyggAhzRKDuI6xkr4CQjtHrhwm+7rCJnnxZ0=;
        b=PRq1oG9/84p+dfBKVMn5Bh1rGyhl8vGwUwBt8FrxEuTPivIcXuAKqbk1Bxpq0eg6HS
         hadwyqR9iHLExle9tCR/B1d6ItL5fXcOYN3EWjAPLapI99lGdVMGCnBF/FymKTdHYY7h
         xl/Awlk5qrdbiaVn78Dq6T/4G/fzvTgbErvN3ne/qCIfdGzWfgPXnc+8m6aDctqZsVuP
         IMr2fg4cvaKY+t9b5liaXYEJ/ZznOP23H6a9IPGjscTCKdQ3i5gh15InAHpm/fdR1nc9
         ENSLisd1t+M1QuHdcf/330xVJm/fjwtvtS4PBzIFEo2KvMpq9tUGPWzhNCVZ4gNjgBQT
         oORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7tFSSksyggAhzRKDuI6xkr4CQjtHrhwm+7rCJnnxZ0=;
        b=Cr88+4sFsllFxmH9YF33Z+2Ubm1FIYj4GyCDcvxMB6oGXFH/xknpKdwEEhNjUJT1w1
         ff9+PcJdHxy549T1ecEGcDp57CM91lrv631djBgdA7JAlw+/RsRC8v9UpUqXYQsgR+3X
         ZCAUWR5sv1FRpjOyFlz81Z1gEbWHPnDwrM6O5AlvRXSyGkCDIPeeBXgyJnZ8Zrx2mDfb
         SeJz0ZeGJFLsi11w+SXMbdwyGC8F/va1GBnqy6Y+97zz0/XgCBUhUlHxZErOU9cIbLDE
         IUm/GdhUWS4PII05qNCP9RtZkR6Hd23YP1rpsAcsIo3l7csRV6ly3M3amHia7nLVnHog
         oPGw==
X-Gm-Message-State: AJIora85t4ygeOMMLxF0DRidi5Lejz4ou5E4mXOZwdUBKCx0kW1o5La+
	FCye7jcLBsdceUV0As32v79X1fv8TLRYWA==
X-Google-Smtp-Source: 
 AGRyM1sDkHwyS98pbHWTF4PJKFxOgV8LtdonqRTWnzELVR/73fiK2umA07byeSAHwV0lKn4TN8L43Q==
X-Received: by 2002:a05:622a:1354:b0:31f:855:123f with SMTP id
 w20-20020a05622a135400b0031f0855123fmr20638724qtk.91.1658957883171;
        Wed, 27 Jul 2022 14:38:03 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 fv27-20020a05622a4a1b00b0031eb5f07b95sm11578279qtb.57.2022.07.27.14.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:38:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: remove zephyr specific testimage hacks
Date: Wed, 27 Jul 2022 17:37:58 -0400
Message-Id: <165895787846.2801379.8906823145084753645.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727165611.7089-1-jon.mason@arm.com>
References: <20220727165611.7089-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 21:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3606

On Wed, 27 Jul 2022 12:56:11 -0400, Jon Mason wrote:
> meta-zephyr recently was fixed to allow for autotest.  Remove all the
> zephyr testing hacks and use that.

Applied, thanks!

[1/1] CI: remove zephyr specific testimage hacks
      commit: 6e4522e1c6b808838d065e36c0967a4a95cdea4f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

