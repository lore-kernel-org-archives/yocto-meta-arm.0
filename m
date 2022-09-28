Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4459DC54EE9
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:19 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.8011.1664372532472428183
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=HiNM18NL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id ml1so8163226qvb.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vsczlYldUn6G4Rqt4IFZjv03u/C9rbhNT4CR1JOf5Gk=;
        b=HiNM18NLHN52ad+f/OiVpBDXkR9CVRQv42ADRTjQBaBXHZLrq7BrRVy36v/SO4SCZJ
         FWZw/JJXI5CQ2UL+CpaW3/MnBCImbhB1rPzhAMpzlP7MDfjcP1PO9wdKf8uG1UOoJhad
         5KI1n0MG20RVECp/pioFZi8eO6BeOMD7lCXIu0e6NowigrfpVukNeSMarxkJe/Bl+gIo
         YcvxbMGQDzijhdgUkhaYp/1jV1sqTW14m43LvwMdGTQ7+sRhN9GL8NKD1rx95O2+fvNH
         LmzXnOHzD0m9Fg5x5C/f8twVabXk9BHwyMDQBk1D30OFDbuNk89xHc6/0BJ5egid6XI4
         JZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vsczlYldUn6G4Rqt4IFZjv03u/C9rbhNT4CR1JOf5Gk=;
        b=mbPGqOus2XSDOUHNJTCvGCAA5dZNw3v+t2QaqGtmvy9i0dzE10Ma0FjCd7rwHJXsWx
         R2sdrGlKTmdFyYoWYiIsU/nLl92qpWMJJe2XZtFShTQ/Dp0wPRb+0VAEIeGH8y7G8xbT
         jr5oMaSfpafnZgLNvXJXG14iLZhjJ2sxvD5qjr4nebrk7ovzUZ2hA/lTP16yrWFbelZC
         BPP+eSnv06St3geyzm2QyoKRR6g+nnQG6v39mJfhjPNKuwu3wZMkmo3VKyslDu/P98IV
         oG0UZiVMKNQF3wfKnmDXZ2cbrG1NF1vvJAepUT1OMWWgmQ3qB5LUVV4mTL2wNirXAOvL
         Raag==
X-Gm-Message-State: ACrzQf13SnoJknCGTcshdB6pIb2gP5GIEg0tB/Sf1VJdN90RQ/6bzoqG
	uS6pM5m8BnJAM2jRDjoblouasS2KvDKY9A==
X-Google-Smtp-Source: 
 AMsMyM4G5G5L+15eDQXqH570/pGtXUifcEaFxjSVu0VE6L24VIazWleU/eeOm7oSVD9Olzgo4JeyXA==
X-Received: by 2002:a05:6214:d0b:b0:4ac:873b:ef73 with SMTP id
 11-20020a0562140d0b00b004ac873bef73mr26104474qvh.82.1664372530331;
        Wed, 28 Sep 2022 06:42:10 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bs13-20020a05620a470d00b006a6ebde4799sm3071012qkb.90.2022.09.28.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Adding a test application for external system
Date: Wed, 28 Sep 2022 09:41:56 -0400
Message-Id: <166437252283.2315819.4109081662202147661.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926121521.35674-1-emekcan.aras@arm.com>
References: <20220926121521.35674-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3852

On Mon, 26 Sep 2022 13:15:19 +0100, emekcan.aras@arm.com wrote:
> Adds a linux userspace test application and a recipe to test
> external system in corstone1000 platform.
> 
> Emekcan (2):
>   arm-bsp/test: Adding a test app for external system
>   arm-bsp/images: Adding external system test to initramfs image
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/test: Adding a test app for external system
      commit: 037011da6490fd34e7a9f29c1eca3056ef5d904c
[2/2] arm-bsp/images: Adding external system test to initramfs image
      commit: 4a190f18def7355699fd5c4fc8657dead5b07e84

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

