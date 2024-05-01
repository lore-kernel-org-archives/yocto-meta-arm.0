Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA7CC10F16
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:07:17 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3181.1714529227227048881
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=aM3dATa+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78ebc7e1586so45388385a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529226; x=1715134026; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGzTJ7z0/RqFkk/Vh4WBNFt19ywKEcB/+3FYLMfMwjk=;
        b=aM3dATa+uakhMIhg1c1Z+/UkFFpAeoN3vhxgRYGw8CsFC9rXHiGfOhs12gz0BNNgbl
         RZG9wIK1r1ngD9gQ42Xs+XjeyAimR9qdBhEGspaBRYPeaoUdrmOaxlMVuEHW/IXkZeaa
         y+aDgjxhOcMUbFRISQV5GVAiakBMjQ5I50SDHqoPFmQJ6Kl2Y2jDwV5EPQGV29iIsLfq
         nxsX6JkltjcWwnL0pCz+mQJLgKLNEF9KllLmEP9TRpuIxqHvQqUNX0gxHYUQSVGuXzu1
         DP0IqxLc9t3NXKn/5rApdsX3z0u7o2BwAIOtXk9ax87LTez+PzrCILTqi652PDw1BFU3
         /Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529226; x=1715134026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGzTJ7z0/RqFkk/Vh4WBNFt19ywKEcB/+3FYLMfMwjk=;
        b=e5zRf3v+iJFlQqAixRGpZWjKOrP7057QsDprm19xPWcJNv/EwrDmQIN5guym+RzHDr
         0MZVjwrCp1HORLQer2QMm+72SeesOfmEMTi2ukRAGmFucNgDrc03Z96qyppvFojIqENf
         urRTJZ825yz3xaPGKgJEHBWewUNidnRAJpRE8+X9fhI0AF6Q4ZAafWrrI8VTRidW+5UD
         qEYkKsL1hoF/hI+e97qFpIMrwPn0HpP1xNBBjoCUhHFiuLIlSzIjDe67Lx0Tok6JXttu
         y8uXuQWhM+M0p0OLnxvbHpWAE8IWaau2vCx2Cyi7XgzPjfvEjjMY7LiQOh22aV7Czb4T
         Mreg==
X-Gm-Message-State: AOJu0YxtDeU5R+kQcJ9AOupIRkmJJGMw7NjdD/ha/wH4Y4+4qLTCN3ya
	i8l3AjON8O+pLG9IsqOPKkK1VLZ86vwmoEq0GV0kOIO4XBweQUy89sL91gEYSjViw9Xi4vSt17I
	=
X-Google-Smtp-Source: AGHT+IHEA3sKvLvKyNnn3P4YajA5Mbs25YC6R2Edwx2yBz0f+Vtd/bBGBv2cENLuHc/S+gAj7mhxsw==
X-Received: by 2002:a05:620a:28d5:b0:790:f321:71a1 with SMTP id l21-20020a05620a28d500b00790f32171a1mr2940571qkp.28.1714529226046;
        Tue, 30 Apr 2024 19:07:06 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id q3-20020ae9e403000000b0079071ee067fsm8830280qkc.31.2024.04.30.19.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:07:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/3] Cleanup CS1000 recipes after removing OpenAMP
Date: Tue, 30 Apr 2024 22:06:52 -0400
Message-Id: <171452921871.3441774.11248813394713426815.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430160301.802105-1-bence.balogh@arm.com>
References: <20240430160301.802105-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5673


On Tue, 30 Apr 2024 18:02:58 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The OpenAMP and libmetal references were removed from the TF-M and TS
> recipes because only the Corstone1000 platform used them.
> 
> The docs were also updated to reflect the new A+M communication
> protocol.
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/doc: corstone1000: update A+M communication
      commit: 013dded5a480324e7d262c470bcd5e6398ce0faa
[2/3] arm-bsp/trusted-firmware-m: remove OpenAMP and Libmetal
      commit: 1d122b18f23a618e97c6ad703bcc0e39eb23317a
[3/3] arm/trusted-services: remove OpenAMP and Libmetal
      commit: db28829ff85b58e1977b6382ebb60ab4da92b10c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

