Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AA8C54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:10:36 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.5698.1674526231531900708
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 18:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=H6BP562S;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id d13so10713170qvj.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 18:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8he6nyB9U34XaaPmvjp5fGGfNrw+bXtMzriR2rZEFo=;
        b=H6BP562SNQPZvPtai1g9EdhbxP1/ho75Z9zki/DZ00lBJ3l/wQzBXRLkBt+3VwRK/C
         websHGTwnNPPg9gAdCNu84rAzIklpZW82JHpitDPTOhYQfBYIY7kdwQ6Ue2a2FGrc4+y
         ryjr9sTNcBL1dNJl2Lrf4gqFFwV+GQuv8tNGVpZ59KyrRkvQ3CZNoPoFs1eLW148MplX
         9uDp7BxkWwnHih9G8nYTAbIpwmPHnf5eShVrN4/k2/vHHxYmbtrus32rw6XP1IiLD0Bv
         IIWOwu+skSR6McYUK0dg+DPSJ+n789Kwqp4j5bBnngK5tnhFN2t7goc51Afuy7QRfEt0
         ZOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8he6nyB9U34XaaPmvjp5fGGfNrw+bXtMzriR2rZEFo=;
        b=aoGzY9IOz6zIw2/CWpH9Xeetf24NkGvEXYQt5rs5SxiRisbVRWfTRkoo0BIcBgGMnC
         9nylpyU7cm5IAyQhhVIEcVRr8IV4XWlwGPy22GcBXS8pZpZ8NMpMmQWKyLczxFtEtwCp
         XIsws8XUN5gK8+1PXa8dqe9QecdDef6oEcgdBn6tKB4YBjj1jN5v2oTw1iltQehahH6h
         oZyBwxwNvCiIxgnecJRuTfUZfAthCdqCes3p5xW9/Kfntj2+y5Lgdq5zoyjOyAwj3Xpz
         wWM17nVegWNekSMFvt6X+D7wj8ufwfuIZKBQ6oHU1PJpjYiQ8eGfkj8xljXVVhtY41Ml
         8KqA==
X-Gm-Message-State: AFqh2kq2FYpxIJtPywbt5SK5u7Dy44ISbPTygEOht+ITSzGze/LgxIuk
	Gx3KKX34Bt6NjLi3qydsmf+Co4xHMEa31RBX
X-Google-Smtp-Source: AMrXdXub+6fLZyIu2fVvEtRzh99YCgUwrbQvl6v3H02Gfzm4UQDPeBzC2m1b6J6BzDq0gXiF8+bOyw==
X-Received: by 2002:a0c:b419:0:b0:532:d34:5aaf with SMTP id u25-20020a0cb419000000b005320d345aafmr38170153qve.44.1674526230134;
        Mon, 23 Jan 2023 18:10:30 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id cx15-20020a05620a51cf00b006e16dcf99c8sm575556qkb.71.2023.01.23.18.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:10:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm-bsp/trusted-firmware-m: corstone1000: TFM file clean-ups
Date: Mon, 23 Jan 2023 21:10:27 -0500
Message-Id: <167452622808.173967.2407744317674190749.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120145647.11758-1-jon.mason@arm.com>
References: <20230120145647.11758-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Jan 2023 02:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4320

On Fri, 20 Jan 2023 09:56:44 -0500, Jon Mason wrote:
> Remove unnecessary spaces and commented out appends

Applied, thanks!

[1/4] arm-bsp/trusted-firmware-m: corstone1000: TFM file clean-ups
      commit: 12cd5e1859e02478c4883ce1ad30728f6f2b512b
[2/4] arm/trusted-firmware-m: disable fatal warnings
      commit: 9b6457de82db5d0a2b722afca7d39fee5b78037e
[3/4] arm-toolchain: update Arm GCC to 12.2
      commit: cf43a3c3982d56746461764a73fbeeb4dc44c236
[4/4] external-arm-toolchain: Enable 12.2.rel1 support
      commit: 9166b5deeed17a41324338054cabb6a300f014d8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

