Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DB5C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 00:24:16 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.27191.1640219055687840846
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Dec 2021 16:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=otMQVLCC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id m18so3007739qtk.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Dec 2021 16:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1vKcQpw68IazUuc6Aip4s/NBoke//w5sZ1FsTWeZbo=;
        b=otMQVLCC55LQnUIg6bNRzh9U33+SdHMA5c9i7iCAfurN7mHmIVfBjEAH/VjfdqnLkf
         SDI1XeNs56Kj2vtlspk5yJivr8hDK59wly/vAE0+qGeWD1LZ/NbwKfxJU9JB43hxSEu1
         Y+FRgggFzJQuhaw7Q6yW0Fc0esaTY3pCjOvzX0A/A4pm46gN1qfbL7+ANMelfZhiurR/
         5OBOHrKt9iKNEOF+WcGZt3KCsj7kIPQWx0WbmXl0+xMrcyiOSHbCTuP/VB2vv8mLLey9
         1gE5awdVj/mFqEHSpjsBrW9YuClaubeeevngOUNiUiI3KNm1Vs+smzGpZGOK1E86z5AL
         KAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1vKcQpw68IazUuc6Aip4s/NBoke//w5sZ1FsTWeZbo=;
        b=6qDWNiwy/QuohNOZAZ9jxW0CtnlYYqxOWlSW3rs5vmW96UUsGYYtJKQN8rm7YbF8uD
         dt/TS882gC0oVpWTzTjkB/7MIA/461xy76xkpsC0BMqo1VKNKOiSoeWAJHmaMZEet6yC
         7Znc5KiAisJCebkO0zDbpwzIZhTmtBvBO6LsZl/pMLSL7hOFuK/OtyqBYJD8U4t6iLMj
         wJeYCtMCDNWpYtea/8MEnAm0hCmbSIPiLvx0mVkSQRfBhMJSgH3Y7y9YiFvdMy/bJIkd
         vq7+31sdVX2dHImeD+q2hcrj0uHDfOKdpnl6rm+20eWetBD9g0K08BVI221OJ6MWS3lx
         He9Q==
X-Gm-Message-State: AOAM531sXb/k5slSVf828GeWNExQbbS0bX7t719AV8/2zgiQpRwZH+eZ
	R96I7a1vLLrRj+cz6OWUwyIlGKoFN15s7VYz
X-Google-Smtp-Source: 
 ABdhPJwmCz/jBkQWytEWHf20oqQAbdhYitxi3eWrXgmE4mSkqKoS8cLsmrcWTI9QVbtScuR99DNXdg==
X-Received: by 2002:ac8:7489:: with SMTP id v9mr128870qtq.676.1640219054452;
        Wed, 22 Dec 2021 16:24:14 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:2d59:d09f:1aeb:71f0])
        by smtp.gmail.com with ESMTPSA id
 k8sm2956308qtx.35.2021.12.22.16.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 16:24:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	xueliang.zhong@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/u-boot: add ethernet device and enable
 configs for SCT
Date: Wed, 22 Dec 2021 19:24:07 -0500
Message-Id: <164021876661.21136.3791800888043931913.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211222133515.26174-1-xueliang.zhong@arm.com>
References: <20211222133515.26174-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Dec 2021 00:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2766

On Wed, 22 Dec 2021 13:35:14 +0000, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> These changes are to add
> * ethernet device SMC911x device and this is required to support
>   bootfromnetwork SCT
> * also enabled other config options to fix SCT issues
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/u-boot: add ethernet device and enable configs for SCT
      commit: 6e16e76bf3fc0fcf0501b9923eb2306a910da6af

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

