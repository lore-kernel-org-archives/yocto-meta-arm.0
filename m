Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E52C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 15:55:12 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.10523.1641484511099942069
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 07:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=JBSAP8uv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id p12so2708526qvj.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 07:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=li5sjSlF9Nz60X3K1SjltUOKsr9mgp1/t12qom1+hzs=;
        b=JBSAP8uvs3LaMyORufMhVKa3VQJmtC9A0iIjQ0lz06lh0k5zfX6O0dahwAKz+8uGJi
         Disr9JMPFEuBYXyFdzH9SP4DbM2sh7CD4nMmgi1vtbei2Ugh9nCX3XskTZJXqvvSI49m
         VGT8HW0h2O1qwAD9DpswHSg8X35qSJLMj0cBODHqgPZLvFl/VeGYuzKkmD09VdIA9gwU
         6N2/h+jJvttwslqNn5ebiWw2wP11Od+TPahIHbIYOGST8UfTZZ1sXlN3rpD7ujrbbyBZ
         W63KJRYBLlRMKfuCG1UnriaJ5hP6mMegoUx5hC9kzdkn+zzHpVTwLCodivwnXF+96KMS
         TTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=li5sjSlF9Nz60X3K1SjltUOKsr9mgp1/t12qom1+hzs=;
        b=YBeN9bBwGBXA0rkvC0RvcDGLRJJDQmPNojKFvOFDFavACw8vr3aZyHIhJTF6VjkRIx
         NmPENoxKISKJBzfKBS1exxuIw9I3w/pPghqLVxQaFt01jMKGpod2YRzADUr5lGaVmnNf
         4PFkQ5wo9VcHeu+j49DDCF+V4m6yvRQR0t+0o6XXhZo9BVekZ9KuIZFhBtZfkMZH27Ch
         ABhwPrVLiWeNTpNgqFHFguVouEQ8AZmBf8BTCwcFNXbOWSE9cdLZ6mG6WIhs729XyC17
         teIJ/1TCaNRXyJ+VMGkep7y3aYjYbp6IyuqwzKtTdK/F1j23ZJESdwFAj5+b2CI+3Cla
         Jvhw==
X-Gm-Message-State: AOAM530VQB1p6knclqe8z+szWRT1kw2O/Ag45JrFQC2uF+ozLjWE+vsv
	NmhwMQHQKr9SXlYk9D5OyZr+MaoH2cMSaPcS
X-Google-Smtp-Source: 
 ABdhPJwWkQeV8gnIsUmPiZ4NTWXoUes6hYHcgKcxZ8Dlii+gPjH3xQ1U+8C1navqZVWpQR0AkGyWEA==
X-Received: by 2002:a05:6214:627:: with SMTP id
 a7mr1443869qvx.103.1641484510068;
        Thu, 06 Jan 2022 07:55:10 -0800 (PST)
Received: from athena.kudzu.us ([2605:a601:a63c:b500:e36:844a:4b1c:4e72])
        by smtp.gmail.com with ESMTPSA id
 y15sm1656287qko.74.2022.01.06.07.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 07:55:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
Received: by athena.kudzu.us (sSMTP sendmail emulation);
 Thu, 06 Jan 2022 10:55:07 -0500
To: meta-arm@lists.yoctoproject.org,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/1] arm-bsp/uboot: send bootcomplete event to
 secure enclave
Date: Thu,  6 Jan 2022 10:54:51 -0500
Message-Id: <164148449095.2504935.8234972590055489573.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220106134730.10276-1-xueliang.zhong@arm.com>
References: <20220106134730.10276-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jan 2022 15:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2808

On Thu, 6 Jan 2022 13:47:29 +0000, xueliang.zhong@arm.com wrote:
> On corstone1000 platform, Secure Enclave will be expecting an event from uboot
> when it performs capsule update. Previously, an event is sent at exitbootservice
> level. This will create a problem when user wants to interrupt at UEFI shell,
> hence, it is required to send an uboot efi initialized event at efi sub-system
> initialization stage.
> 
> Vishnu Banavath (1):
>   arm-bsp/uboot: send bootcomplete event to secure enclave
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/uboot: send bootcomplete event to secure enclave
      commit: eb48eea8017680d3f3b3288db30a6bfe007ba009

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

