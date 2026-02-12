Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA18BEDF02B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:03:01 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37382.1770868978939211180
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0D2qe31d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89473dca8aaso81596486d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1770868978; x=1771473778; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avs8ZfN+im1wrkkSkxnVxSnYVrUuj5bx3kjEHFGabP4=;
        b=0D2qe31dPAhQy62YuaNzB46GGLCtRBvVqHts2tTk1+AR2hcDoflAB1HoScIfnk+luI
         qg5MXOxCwL0hWXj4+uQ2ziE+f5wfenAuqpMiNw7iFMJcdlAqU7eAVe3DNyo0ESYe3woX
         uBo2n7diEY1LHlWh17cIBDM1YBtHQ12iP6rNr2vZJhRDs2dKJhprYYUF6evsqrPBGDIL
         ImWpy3mGYIH5eC516f7Ne7W2yJxoELrrEwPzT1puKgREpo+Y7ahL3ojYg+1bGwkFvzx5
         obxCYTJkb9CeMQwPWSu7HlG/sE1Stt6i2ULT6m8VKRQrUUcAWYaCFF60IAUvwad6RM15
         0XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770868978; x=1771473778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Avs8ZfN+im1wrkkSkxnVxSnYVrUuj5bx3kjEHFGabP4=;
        b=w+gyrY+teLBK77U1L9QFBf0zrv+ccaNd/VNVwfNhQiitdw1bYVM/2OQrasQcbCl/+R
         mmoj9W3P+2g/LUCbMAM7h2/Ubqz1fVojZB2JFXOJqRDkS+eo/HLErZR7DA8MEM5OIriH
         +xjkzs47vDk3mgCqqJb6cELUVw4BP6Pqx90Fm7xxxpCz2BLDETdJX6xNf5ipae2nMurk
         NOCNpIYxn8aeBK3DHtMyaXTTgV6/JucdcGiowvFQLL4vJgBS9RqAE7dR/x+UUXJImgYJ
         fJmZC/vDj0d6XOpgxum2A6JD1KlT7kANQfzYLNMg9GJR1ETD6gWwdc3fwU1xRlMfodQ/
         19dg==
X-Gm-Message-State: AOJu0YwABuDi8l27jgoT3qTjeGiPL7LjRfPgyCwvB1v5//jGG9Ycx6+3
	QT8pOwiXJ64GHtQ5Ac0IfjDevfPNgrcZB3buGZkr34xrGpbyD/2B02P3TLC8QQZDeVhDK+QJhkY
	5mX8=
X-Gm-Gg: AZuq6aJ7B2APzvlBhd0avvTiIv1MQt3ucZNsjcfniGT5cBKQpd1EUqlS2qKxSBNg3mi
	x/WXtREErt6/3kaDfQW0dejJXuT5a89SsXAxWGoOjw5+f0s6hUV+5AfZGUnGTpe6sQVBNFe/rJx
	DoF2dqW69gyg0wnC1aXd7hzBYDu3xZQnGKV3nBV6GHFzpsWH2XvKs0mXMnADTn97Pqyth2po3iJ
	fEP/oT8XYrJRFwM74OLOYqiZ+eFQSYS2uvjWiM67n/iUev9ljezQwQvDc6VRPLny1PB9cV1diu0
	xxDGeIgsnV622ZWfWeWxGoWLTIpbD9W7xBWuYQcihevKcsl4B3QgdCGyqMXD7sng64hGVMK49S6
	guf0QKYCCYPRiUW6mNc7tc9EenCZ+z2/p9wpjbURGJsG1HjeJFS6fxmHV50UKxtOtXgAd90EsDp
	o97jvQtcn9UDcD
X-Received: by 2002:ad4:5aab:0:b0:880:498e:a63e with SMTP id 6a1803df08f44-8972786534bmr31151256d6.2.1770868977641;
        Wed, 11 Feb 2026 20:02:57 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc959e0sm30595516d6.16.2026.02.11.20.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 20:02:57 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-base: add MMC and 9P to kernel config
Date: Wed, 11 Feb 2026 23:02:30 -0500
Message-Id: <177086895275.770080.4087644744886657497.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210144123.64352-1-jon.mason@arm.com>
References: <20260210144123.64352-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6907


On Tue, 10 Feb 2026 09:41:23 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm-bsp/fvp-base: add MMC and 9P to kernel config
      commit: 50f14fa9bd35fad0370da33bf0ba0f0687ee5f3e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

