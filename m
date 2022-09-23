Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09923C6FA8B
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:04 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.8877.1663947115171414555
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iBAfRoFY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id l14so124582qvq.8
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=FpsXFCM7036eBz4QgV4AyCIVGXvFVs0pT+8O5JXK+F0=;
        b=iBAfRoFYZERPV6WICVieKB+/vq9MXbLPV0K3M49yj0vMSBG20rov2rRSwio29Q/n41
         RW2m09lDan99VoZu168J1elt1TEQT08apsy2POTef8CrvzfMpYLYojPKLakvyJeqGQFe
         DuOrEBL+bU1VqOmjsUYoT7O1Tpg2GE5BAFcCq4LPzrbWYK7jfWiLtfWuprDmPwPdEgfx
         VvvGAw4XS/q55o1FUbj099A7AAtMv+1i5j9YO2Jkc2iwmyeZ8Y0sKnkh+Qvov8LMpMl7
         /Ra9ZV+EJXkGxBLm77Uz9ciuwWSxqb5SxzVLW+ZS2aI/QAcV8XXuAS+/4xBAU4yIi2pg
         Ne8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FpsXFCM7036eBz4QgV4AyCIVGXvFVs0pT+8O5JXK+F0=;
        b=OgGqMbA3BAEazCgFjpxfejGSrGzdZDLkvmrohYq14O5XiulfgeqCG0nfXqpXA544Zb
         GLFBwwRdPRKybyrWGR4zPONHqj+8T7jstEP+Zl/IRtR+MuzGxZix5lQqAmSS7VvD5YLo
         khQynrGFn6nuEyeX9iTZzpesvgOvO4a35VChWV0SPqFy8ktVbNR5F3ryQN9141fazFzL
         N3voUBQnhL9K98/qE92klhVEXa31CPI6UoED9dCatXTyUNxPeCDEWjMosrN9RATBVMp7
         5Lcn1ubuFfqMXi/hp/OLEkmVuxiuspJg3yjdAdY9tYA5G9lj/Zm5e/7RBaFhjv3QrXia
         mKLw==
X-Gm-Message-State: ACrzQf2H6R5p16ynW7fA/Lhabz+zs3R+tBXpz0KNVZ3W76VF0EThh2+b
	H+GZR866xpRKWYiGVC3Vkp7ykcN4w0+q7g==
X-Google-Smtp-Source: 
 AMsMyM4KiHEnF2uMzlvYyY/KrHZA2En2CDO5/k5BwHJkXUUboKU2aRA07Ys+0IJeIIv/kxFd2BYSTg==
X-Received: by 2002:a0c:f20e:0:b0:4a5:c54a:de4 with SMTP id
 h14-20020a0cf20e000000b004a5c54a0de4mr7224162qvk.30.1663947113754;
        Fri, 23 Sep 2022 08:31:53 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bi10-20020a05620a318a00b006b953a7929csm6026613qkb.73.2022.09.23.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:31:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/edk2-firmware: Work around clang issue
Date: Fri, 23 Sep 2022 11:30:58 -0400
Message-Id: <166394706727.2062239.14126894596564924205.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922125653.22079-1-jon.mason@arm.com>
References: <20220922125653.22079-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3820

On Thu, 22 Sep 2022 08:56:53 -0400, Jon Mason wrote:
> A new update to clang is causing warnings (which are errors because edk2
> was Werror by default).  The error is:
> clang-15: error: '-x c' after last input file has no effect [-Werror,-Wunused-command-line-argument]
> 
> Work around it by disabling this specific error.  Also, use devtool to
> update the patch.

Applied, thanks!

[1/1] arm/edk2-firmware: Work around clang issue
      commit: 9f532a8cbd503c0fe69ec6c1684f8f70ff4c9471

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

