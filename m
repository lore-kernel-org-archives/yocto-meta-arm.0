Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F0DCCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17327.1762440249418692358
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=vyFFL0j+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4e89de04d62so8668781cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 06:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1762440248; x=1763045048; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4naLQsHE5gHLouu+G+hDnmSdSCF5RR4j5+HSGHOP+Y=;
        b=vyFFL0j+NhpdzUaGpDR8ZLa2CQYoBv6HRQjbI5oPvJtvd85T8POxNAhXsLNcvsct6h
         y/j5sMVnYpAiBayQP52r+sZfhWZEvQkVsZ07BftLq5UFlcA00rm66WyEwqiV6g+njohW
         1FDxXcxnjz5GnjXWE9oLq7MGSINrAifDvesN3MrE4B+mKHsJ1H40c4TKf6Tjj7nw2t15
         8BsaPcdD6L+IbgpAnMMF+UOU7xxqfDVsXcmI2LExK1nxNGe7bwDK1E32GBTg07kWN+h8
         1dqsG4mUdZ8biDgzDiqy4S3JAOkvXC+pChhc13faUyA4ap3xykP/Bb2Esr6wN2Fk/L+j
         wl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440248; x=1763045048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4naLQsHE5gHLouu+G+hDnmSdSCF5RR4j5+HSGHOP+Y=;
        b=jz5Rh+E7e8HM8maJ3CHH14G1Lw8A8Lb5RD4w3RL/dPE6fkV5FD0RZkqnyqfBgSITbx
         11pIxb3GvZqjP2dNjJTueoC2PUMSDvCATvl0deCcEYueqt/9H94/l1jXQvYPfQAzO+nW
         JD33NpaPNI+7tvHnMxzMfF5WLa0Yk6QC+uGzuB0AjMHCRdtY72e7k8aQevNILXSHC7uz
         GKzE4LnDkU9LKHD899y6BPx4FAqapKAZ6XQQh2S0S7JGnFBRmo44Cm9X/6D8V6wvmmBx
         8opmmdd80XpdacSCUWTG+Ony1IK0IJf3DdS4E7nzGD5pmxhlON4kHD4MDH2w8dKQEmAm
         fd6w==
X-Gm-Message-State: AOJu0YxAI87iKl2uDOENNKk/Yy/FfS1B15SJytXT857ApxhRwuwi2FXT
	yp5bw2ZI3w1w6aOa9ZPGex55BBsiD071BuO8O8vuAh2vmzWYbtBr6MUGXAMPutR4Dqdxc+OdS9K
	w1MI=
X-Gm-Gg: ASbGncs92/wRWZE55k+Fax5QpqsNCAlFCbqVpYs1TRshdU77SH40mvxOn56fBIK16vq
	5PYoa+D7tKP27B/uFXvyy7tFVxgQkpbFsylvhK4odxceketIada51pV7MLRxSMVEI3K4GDpeTyh
	V345cpIzCci0rpLDe8YIgTHLWSa2tw1qkjc6/vR9nuEc6K/pa8jTVdF5PBldZ5tGeGRGsEi+iJ5
	OvwGhXZQ2EPVuNL/Q+VgU6Fa/F6iUZlAze+BilxQdCs0RkqFTNyzuQYC87Vd5lLccDFw5Dv/Rww
	kk4jGYbbISEUlXgGqAdOi5KopY8zWybEXVf9xWkI6Wb8HDLvGfQNCzGnOZGCN9hbuvFIkkAZ+k2
	P7em7+eGY+PeIqcaEihwUJ5HcMfnOIBnnm/blHO0lAYpE0tSiCWOg90cLqwHOxnerJPhZppHwL9
	8L8g==
X-Google-Smtp-Source: AGHT+IFrcaoOzk2mYV/29GBGLSKg5+9mL3Iuw+IZvnIirT+eNdrK0jflcOJ+ylqp0wId9JMDnjNmpg==
X-Received: by 2002:a05:6214:2681:b0:880:2105:9992 with SMTP id 6a1803df08f44-8807118f638mr96544626d6.45.1762440248182;
        Thu, 06 Nov 2025 06:44:08 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3d847sm20390536d6.58.2025.11.06.06.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:44:07 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/trusted-services: use SHA, not tag name
Date: Thu,  6 Nov 2025 09:43:52 -0500
Message-Id: <176244023312.1691764.2857872183940466820.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251031142153.2226419-1-ross.burton@arm.com>
References: <20251031142153.2226419-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:44:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6757


On Fri, 31 Oct 2025 14:21:53 +0000, Ross Burton wrote:
> It turns out that the base SRCREV for trusted-services is a tag name,
> which meant it was hitting the network on every build. Use the SHA
> instead.
> 
> 

Applied, thanks!

[1/1] arm/trusted-services: use SHA, not tag name
      commit: 6fd10047a15bc07d14646b82f0d81613e405cdb5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

