Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F1BC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 14:09:45 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.40724.1639577384583024759
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 06:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=aBsZmz+u;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id 132so20037338qkj.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 06:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3eyWOO8tMdnv4Dle9nn7VUttJX4GXQj5DvBGjWLEwJQ=;
        b=aBsZmz+umSRLHfzmKqvJzWGfGhVfSpzVzRygmrKfM7cGBAGP92D7ITs/XAk52HcDDy
         i7QXypIWVrWeMPfF/Od6R+p+EtZ2Qe0PHinMM+RF/OS2+w8rJye2W/y0IOfO5uJnlpp4
         MTep7xz8Is5FTKA4RkFs1gqxlc6hhtt929k8PYkOsaX8spHK76/J1RwH77kwEMx9o0Vo
         nGJJzN5O6ekOUh9JcWdqf6KuCvBfAAyp47g55pp2xd0Db5N0Icvd/xYT7X48VmuFYm/S
         tHPSs15le1iA2vT1kET/GjRfCvn+OsJ82xeGiaaipyzOVjqDGG1d8NMBcMtYnb099Uup
         kE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eyWOO8tMdnv4Dle9nn7VUttJX4GXQj5DvBGjWLEwJQ=;
        b=PbYwLH7TPcDpZbQ5/620udZDg0UlArayRp9jkSC5+yaU0Sm4Zsbq2apOBJM+1fNLyx
         FY5Vptihx58COjD4pubMQnLYI0COTFB2UIx6kp5CLnvvO4n0xCw7rOS8ncfNXfQf/tqV
         yZ2KYhXpcWlFZnczgqG/r+gPchYIpg9WRTJUz/5A7P4B9/dXnua9yAYETo5tunHTPTfW
         b+qjQ5To7JIumz7SV3yo7nxO8n0LJK7/Tdslce8Ccl7n95eQLlbRIk80TEIx/yCrv0C/
         YpOV2P5BDLI6wbgdqr3ZPR0fnXlKvFMxukVvR9HFanxkrEcSsMUNDBZ5jw0GFx7Z7AQm
         hWRg==
X-Gm-Message-State: AOAM5326xQ88LzILpYxeKHqYTfw+bcO9TwkyVT53pgNtyPxBKDaw0evQ
	uHnamDYtKrHlJlCA0Lz1MsEFE/xkmElkvwVH
X-Google-Smtp-Source: 
 ABdhPJwMLztQgShdlTfDHFL9T0MateU0XFuvymoOR5GF+FrKG8T/2Oyw00naPIQjjUPSCHKqnTGhYA==
X-Received: by 2002:a37:b14:: with SMTP id 20mr8701403qkl.738.1639577383595;
        Wed, 15 Dec 2021 06:09:43 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 w10sm1541982qtj.37.2021.12.15.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 06:09:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/4] arm/trusted-firmware-m: remove stale patch
Date: Wed, 15 Dec 2021 09:09:33 -0500
Message-Id: <163957737306.22877.7703637345854543661.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215111311.3066077-1-ross.burton@arm.com>
References: <20211215111311.3066077-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 14:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2719

On Wed, 15 Dec 2021 11:13:08 +0000, Ross Burton wrote:
> This patch should have been removed as part of the 1.2.0 upgrade.
> 
> 

Applied, thanks!

[1/4] arm/trusted-firmware-m: remove stale patch
      commit: 3d3d04ce09476c4ee0ef953b63d816552a0722e2
[2/4] arm/trusted-firmware-m: upgrade to 1.5.0
      commit: 7519014213977163d50aa135bc85ed3e42c1f13f
[3/4] arm/trusted-firmware-m: use Ninja to build
      commit: 018fd6aecf82409f5f652a24810cf68092ace406
[4/4] arm-bsp/trusted-firmware-m: update CS1K bbappend for TF-M 1.5
      commit: 9cc42e5256f19e08fb5a386ce9e43d351a569533

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

