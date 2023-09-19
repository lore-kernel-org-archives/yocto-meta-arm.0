Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0451CCD5BB1
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:47:43 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.7443.1695127662426415354
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DcOUIcxl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-773e87eeebeso18839985a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695127661; x=1695732461; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLIKgkpy1rWv+x032b1c+sjdGd+wdPmFSx+HyChq2MA=;
        b=DcOUIcxleD7jhY44C+3Db6XFTx2I1fFbjHJsy3RB6ZwiE9djJGsgkrBxI/kxfPqMU1
         FQ03DuFWNKEVUuZcJIzFyJhfBQALUGtMa5USCKGUqIuu/4KpuD31e4eSenSOwQMXpijc
         gUByulxif8HHVmHzh/nEhbEMHJ+vo/LMTCk1PnKvjh6ANbh6GsnZnywtfgpoZVbblSCE
         8TrRTtnf1lxfAXJNL/oQD4o2ekVTyd+XgadMdXeV/tJ5+fVjYyQpS3q5ydUxXKbIF7Qd
         kFE0V/cqu/v1rFrpcUqk2jFuKM5mZdq7tBdJoXVD49GSsEn/9D/skoXAeWmp1i/xeoND
         vtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127661; x=1695732461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLIKgkpy1rWv+x032b1c+sjdGd+wdPmFSx+HyChq2MA=;
        b=LYBtsC4GWHFJYQ7bO3ZTDH11qP9DGqHb+ZcK1+fNvbTuiKimelt3Ze9ByiCPeD3vDm
         X+9jf2xurlCAA+/nUpsg206vW2yMovdS+urTN7LCXoogMFLG8nD0xll+Um9/44ih8LxI
         6/bjJ1DAf8JCIuGOzfYZWfx+puwK5JbhEAmmGEyOeNBdP+JNXYEDSLoFbHwZV3wAwRrK
         +mrWpNhxQzcT4qXbRIsvImp2GzApvf97KRELxjjx1AJdoOgmJsBB6I2LcX+7waMOBisX
         qMixsM5T6MxjN/h0D744QK8pBImq6VozNZOK0NgM/aBAimGgrz7VQyVasqVX9xWSmvNc
         Nlkw==
X-Gm-Message-State: AOJu0YyvX+XeXB/jAqFWhDLdXH1gR+3ifxkno6Y5fDENkKZe6jMBHEG5
	2ZFbOzoCi+jNFhXNRc/eZCN0MVPmFZSRdp0PZwI=
X-Google-Smtp-Source: AGHT+IEBRQOSRkzZ6qxMmKlumUJzlQ+s1lwl+UK7hKO8eCN9W569MOP//uIux1j6GYJNIySH58cGHg==
X-Received: by 2002:a05:620a:13d8:b0:76e:f4f1:fa8d with SMTP id g24-20020a05620a13d800b0076ef4f1fa8dmr11497883qkl.77.1695127661102;
        Tue, 19 Sep 2023 05:47:41 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id vu2-20020a05620a560200b00767db6f47bbsm3954304qkn.73.2023.09.19.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:47:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] CI: remove redundant variables in testimage.yml
Date: Tue, 19 Sep 2023 08:45:36 -0400
Message-Id: <169512753653.938653.13640554005643538748.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918111622.650459-1-ross.burton@arm.com>
References: <20230918111622.650459-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5064


On Mon, 18 Sep 2023 12:16:21 +0100, ross.burton@arm.com wrote:
> QEMU_USE_SLIRP is no longer needed[1] as adding slirp to
> TEST_RUNQEMUPARAMS is sufficient, so remove that.
> 
> Setting TEST_SERVER_IP also isn't needed as there's a default value now,
> and we disable the package management tests that would use the server
> IP.  When they work the correct IP can be set.
> 
> [...]

Applied, thanks!

[1/2] CI: remove redundant variables in testimage.yml
      commit: 9f2e78698e8ab3a53fbdec12a883039003f3406a
[2/2] arm-bsp: change port mapping for SSH to port 2222
      commit: db5a3093f3f597d769c2608b04e2a2615f02fbc8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

