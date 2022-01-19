Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC9BC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 18:59:19 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.912.1642618758785875600
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iTCQrZ4H;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id v7so2947980qtw.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=en4sTiBF3++/fnNDIK7bEtpx03i/3ifsCPwTVrQGE+I=;
        b=iTCQrZ4Htu9BxXNoq1/wIpXXmWd+BuSZCX9leIkdqpoKhMwF8ONrjnPAcckNSBnR2g
         WIGes2gmW39mvjmnsMcrT6Uwre1TB2slLr6Q2Lx3K82B7aMqKNmwG35Zg5zYhE7utseq
         NDjZZIcJXlDswizNAQs7TJjWjjuXEAC8EqcJjgFn0a/3dolXEHMFtGdfRHILplpUtKri
         BNHbaYSjpZW4eIZQRYoCTPmksNZgmkIOjZdPbrIM6XKy2hWt9YtCVQGAgr7LO8aFFW4S
         x+TmxEEEwwojNBojyQI1jBXujEAm3OyT4xlwQh48RWhbrEXQTnHKCdION1EpYyryw5o4
         /MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=en4sTiBF3++/fnNDIK7bEtpx03i/3ifsCPwTVrQGE+I=;
        b=G54fmva6++VEkyjnQXMiqe9PT74ucWKPpsNBfMQU+fTWKMp3FZxSET5igOtwnzbhEh
         vZrYg3Qp1Uk+bkkJ1kAbq6Jt+wppT1tbntPxEYu5+qV+cGKxG8nh1yepIoc8bLpMjVny
         1HDfTG8HaD2waQeG7Yw/CQgkTF7Y2dCO/bmuBxfEaiunaQ+CGYN/o2rAExh8TutalQ3V
         VzbheEQAYM+dKVKyIsZWfvjvnQIzDVS4vg8TsCP29eVXY28C3hjb0VOdD76/xyFyFU2N
         lqPPLOVIKjM7CaaK8S5skgih9zBK9TOBIjUEy6lPHo2ZMmbTZ1+sbrl+vqaKKxErgZmT
         s2XA==
X-Gm-Message-State: AOAM532dEBjPDK//4NXsLk5S/0xRMtZTizcauWS6fVoS1sBMSgsc5Y8b
	PBQxaDU9VQ8sDsUNH0Pl7eMdtnHuQF6eDA==
X-Google-Smtp-Source: 
 ABdhPJx67oFyN1eWzY4h5uecJxFOzcLkmU+ssucV6xc6MtWSYgum49h9aAtB+iA1Qxn6TjaMOAh1VQ==
X-Received: by 2002:ac8:5a4a:: with SMTP id
 o10mr14381794qta.324.1642618757404;
        Wed, 19 Jan 2022 10:59:17 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:8193:15ba:db09:9342])
        by smtp.gmail.com with ESMTPSA id
 j14sm330904qkp.131.2022.01.19.10.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 10:59:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Davidson K <davidson.kumaresan@arm.com>
Subject: Re: [PATCH] arm-bsp: tc: use proper UUID in optee and linux kernel
Date: Wed, 19 Jan 2022 13:59:13 -0500
Message-Id: <164261875367.712049.16214466286098511152.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119144549.52195-1-davidson.kumaresan@arm.com>
References: <20220119144549.52195-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 18:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2868

On Wed, 19 Jan 2022 20:15:49 +0530, Davidson K wrote:
> Recently the way of handling Secure Partitions UUID changed in TF-A
> and that needs corresponding changes in required components.  Hence
> changing them for optee and linux kernel.

Applied, thanks!

[1/1] arm-bsp: tc: use proper UUID in optee and linux kernel
      commit: 8734d146744ef3b1845889e00a2d213625214bc3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

