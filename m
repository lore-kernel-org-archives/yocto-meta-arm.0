Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DD3CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:18 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17191.1762440250583609309
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wTDgYkRo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so10543116d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1762440249; x=1763045049; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReALiBjMb4o8iaO30W39wJ2oYRKvXb4XE8kRWLG2CB0=;
        b=wTDgYkRoSfCwyPKJRrNoGYlw876LDF8a72eyvRvpSPFvhO0C8fm/sKG1XcYKmFZWSV
         xkaiYgFxZC7jU/Xc9ZG4gML/rZ2GTgnOgyXrkSzHm4peTw68FG+cVMxj66/YKcFeMi0B
         3AyPuRl0ZxUA9taVb18/3ta6d0cCtLsg3czZbFy6mobqGSmW2y6pOFXsjWObDeyuiAsF
         eIDpKAYqCptybZ+ctl3GTBVv4MppnjJiGyVrGnWbBZ+7qPkhzlYzsgHiwv7TVi224saN
         e8JWD/p0csofGfDCAesow45lYzd6E/ttM7xtqkqOEBpNPRxDDSTa0BolXssH/pl8gvij
         ZJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440249; x=1763045049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReALiBjMb4o8iaO30W39wJ2oYRKvXb4XE8kRWLG2CB0=;
        b=Jk3nBIsywD/2pLkF5LZoXGA5ZoyZ1ckVgyVPCVpeNoJpvxJ/CbxtvmQw7e/20GxEic
         fcfl+CWNqKz7dLYaojE4+cBokjYdHuP70R+Bq86/dVk18hxftvVJxrsnKg2GCBTj4mBR
         GRkaVAwYVKTyh156MrUh08Ou5itugOfNQ2W2ooyeb2fWLfSuTPwsH9ASERDnz1jYKR8X
         e7c/EX+Na1XOE1w0lS5XRI8BcnxJNbWFlSPrDyJK+hFlR+6zjE/Uyy3bAoTaNnoARTsW
         uSlvuualJvEXVsjgHY9/DHyeV3ewN5LSzr/+wHo1VAON0ElBfN/h5eBWURXPZXbwUCG/
         FcvA==
X-Gm-Message-State: AOJu0YytSd8DjYv14EsVMDFLhvmxLjwMqv+3yawEgaLErKBbx9gOJYGq
	EEIBKQSja1lYkzpHr/7ccTFIcwSDfBTGmxR7DkzDGP7cxvBSj8m54e+zGZuvYYdKppCvj8MCzMA
	fuO8=
X-Gm-Gg: ASbGnct06VLJZMORqnRuNDAK0xI2CPm5xKWAWE65LZ3+0dpI3R1JjQyJJcPB1IpyYyb
	iw2obKN9xm15pB9obQe3rrfSsYvHf1gPHKYqxL2kjj8GkUkr9NmauHhMF5O+9LMh3CuzLuJY4d7
	Gp3smV3zd0aFJHlp77MrC7FBpqtIRlOucJXQO/zvlJda8p2pN0fyA6A0soZi+DnBOKAmX4bXuOD
	/p6AkctpfYu7LEPv9ciwCi5WykfqavOj0qLeLQa28EC7C634g1wKYpK6pKfKS49FziNbI8cdzd/
	ysv8qZEe6KgFggArTjU+sSBYCEXnr5d139sGx+z/uu8ZkFlw7VxCsZNozD843qa1ew/gF9+ayaH
	iw/2aW32725zdfEJgf7tQrGpcAcsjB6t7r+Ih/0Dqziqa3EPi9mRRKOgnDYU/fKY4RRA=
X-Google-Smtp-Source: AGHT+IG3gsqdgOJA9rSdae8B43W4394+WRRY5GchANHg1qNaYuZ6KM4B7snc0byZCIPOn6BWwsFt9g==
X-Received: by 2002:a05:6214:194c:b0:880:4272:9a4e with SMTP id 6a1803df08f44-8808286b7c6mr43242296d6.10.1762440249207;
        Thu, 06 Nov 2025 06:44:09 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880828c2f73sm20216786d6.9.2025.11.06.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:44:08 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: only run pending-updates on master
Date: Thu,  6 Nov 2025 09:43:53 -0500
Message-Id: <176244023313.1691764.14374150910535020517.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251103164158.3062744-1-ross.burton@arm.com>
References: <20251103164158.3062744-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:44:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6758


On Mon, 03 Nov 2025 16:41:58 +0000, Ross Burton wrote:
> This job takes a few minutes and isn't useful unless it's being ran for
> master, or is being actively worked on.
> 
> 

Applied, thanks!

[1/1] CI: only run pending-updates on master
      commit: 82d64955f14ff11319ceac27c7b46ee7ffadd1ee

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

