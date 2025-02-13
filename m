Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE02C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 19:58:44 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.3662.1739476722443537203
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 11:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=jnajM4Md;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c05f3dde21so162434285a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 11:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1739476721; x=1740081521; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEGpoA5dEMeLHeQ7z8Zp67+rVCPu0A/e9Up1OO/MfnM=;
        b=jnajM4Md1p+DIzpvwgK9JLbQH9372pN2M6Ph3iiitk/roNR9DKvEuc0PHWITug5T5H
         TYXj4Cgsni+nG6U6nV0IspyhUqAOQeHhtJJcGZgXX4QwlNXvKT4JVgMSyQAW2HLCNYqU
         DaEaXmdNyd/DEWesSlCOG/bvlh5AEtZKLX9OyQLANXJMyGcjN6ixzsyj89zuSh2r/lmp
         wjWhJwH/EEbAV4XbF0et/2OHrBng1Acsp00K+oY6P7MmfYMJJKDeh4SILq9viuFpkuwb
         l+6ZptmWWhXggqx7sJZfF9rwvJRDBRSWtsx/2ov2AzS5SkNWYq1cGBu1cZbuNv2xcGuF
         8MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739476721; x=1740081521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEGpoA5dEMeLHeQ7z8Zp67+rVCPu0A/e9Up1OO/MfnM=;
        b=edFtqFCHVmmQbgJwrCR6EMgSqdLUCTGZdilUIXFOH1IzFs5gGD7NRE8rRxM+9b9pdT
         BlLhxbLax9xcMIcVwN14U+o4Lab0zpeUatS/P/6CeCrzdbzV3HBtoLE0aBGfws3YpXdD
         1OHu7etjqeXSKifw2wwyPFL7O8fN2xH0+du0stu9NLt5zP5lkD3kzJy2TgFl46hbpkP1
         BFqdoONCktVKhRemR497KJ7xvmutUXCyeIp7LLN9DsAXe9PH4ctCwkwG7CXqQZcr6+Wl
         sZHxGnBXEQhySIxWxwj4ImDG2arfBmL2mZ3eeZnZMo9r8lrqSK4Rckjfbl7PhZbjMimG
         zyIA==
X-Gm-Message-State: AOJu0YySmGNQWFPSzmb6Q7xYrewEEuY03FiYI1sTGGkZrmWIIfGt0BZl
	u8kQJ/4zD2nUHagYKeERjeAQrNzR6zzYWPMmFTSXcHVMEzlaTktHStK3CASfXbF/ctuWSuQ+bz4
	=
X-Gm-Gg: ASbGncs4a4hHLg3a/KHHtP8hUXMQoMdAMErBMB3Xpy9l2BcBPdMtTHoB3bz8yX1yNS1
	0tt6TjtZEQhqSB5eoGwwxdcFZ5JSuMwmTUsMlck3WO1JXZBPQ9XgDYu2uJgJ7/Mjz1yJyW+h01t
	RZRe5r26Eh16DWFGzFXo6bV40vTMcHIp4WSnFoDtauCWLF9MCyvyzolE9C9/2fVhihzT/1Ckm6I
	8j56PkUXFO5Hu0nXxaTQeT1RNJYvWYGxyPzTGfy1j2IyUbh4kQCQLkKGtCBR51/A0+pqT9JupYX
	Zbh87D8=
X-Google-Smtp-Source: AGHT+IHr6DDhdzeRGuVmaWezQPCVXk1VqkZ0soQOggNTK0iSkFOwW/WsHSsn7AZzQuQSA46a9lIUuA==
X-Received: by 2002:a05:620a:460f:b0:7b7:7d6:dfe2 with SMTP id af79cd13be357-7c07a110067mr643157985a.10.1739476720917;
        Thu, 13 Feb 2025 11:58:40 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c5f5187sm128229985a.24.2025.02.13.11.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 11:58:40 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] CI/machine-summary: remove binary toolchains and sort entries alphabetically
Date: Thu, 13 Feb 2025 14:58:36 -0500
Message-Id: <173947671673.3849470.13810142591728553258.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213154922.46233-1-jon.mason@arm.com>
References: <20250213154922.46233-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Feb 2025 19:58:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6373


On Thu, 13 Feb 2025 10:49:21 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/2] CI/machine-summary: remove binary toolchains and sort entries alphabetically
      commit: 7699a460f73d0a13e5f937c0151833b97cc57875
[2/2] arm/trusted-firmware-a: move qemuarm64-secureboot file to the correct location
      commit: a35544a34c0df90df5f22980e2fc9660cd36c6d2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

