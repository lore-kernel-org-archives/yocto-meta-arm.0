Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B761BD0BB56
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 03:10:34 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.6204.1729739432390613832
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 20:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=q2MT70Si;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b13ff3141aso28927785a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 20:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1729739431; x=1730344231; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goURW7MQdQMPj8B221FDe6kwZSJSnUsIVNT21QvYbEo=;
        b=q2MT70Sib6u0Z5ydrRuwF5KV3M3rmqM95HQ/+Nuu/V8L0+M2wYHp/ifwL82LtJO5J2
         AQsHwD83yJp/wnZx4yDeLljg5yfoqKiReWuq/gSx5Ite6K9sJgT2VHdMDOdHgEIfCMMW
         6gNBbn54JbX5WlTom3uBZYP8cRpEieuwh7jbKJp5qPdxB22PMtG7rH/7Xa1PYngpjalT
         Rl3xGskaDUmlYWz3JQLqQH8ds8WMymKjdYgj2t386a8TBs9w+s6OvbtYP9YhBs+Ymwna
         Cm79V9B+39Oju1HmEBcm7fwTW06vXlG8zMo5GlWTsUI2Oo3xZNyCuvLhquk8A4OUYSZs
         ykAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729739431; x=1730344231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goURW7MQdQMPj8B221FDe6kwZSJSnUsIVNT21QvYbEo=;
        b=VDphwSopWBAPDHTnFm+Pc44DVMaQx43WPrTyHQGVVx6c23cR9MWFDlmCQnxwmqg1Ne
         /Sbv5xiGWDMO44viDy/yomSUJ+jou31rB7pa4zf2QofToGEiXkHrqPIOOOJfncrelsbi
         x/mSPdC4fFmn0DJnDmz4doyHL29OIBJ6JnRwv3gCuzQSkzVD7heZhWUkM8mf1D9hkDeM
         n7DLn9R131rlDQJEfqLJ4/UtQs9EX2Byz0x1L+sK6MMAyLh4DHPN6ur+q3xTYbK3VRUT
         FvfYMIznX/326UYvtypTzftE0wmJzYcb/ia8mVMDXrDQatWq+/6sUBuFoqVyGENxpx17
         a97g==
X-Gm-Message-State: AOJu0YxBSIbViyyce9F93TfZ7n7vx0krXdwpeja5R2xo8RRAbqXnBO/K
	N1K+JRo74TPn5ff+agKyslFhCv5RuBR506ohvMEfnvUB4XlAMZWcbuRxl1Jd/hFb7xzuU6qrREc
	=
X-Google-Smtp-Source: AGHT+IH1kkIXdeHhFAOYgmTKOP4fQ1ipMvYyWibPWulXlrqRWDCYLHuM1DCf3/NBNivWDU+p4BPtEg==
X-Received: by 2002:a05:620a:3951:b0:7b1:4356:fd43 with SMTP id af79cd13be357-7b17e5bc627mr629826585a.53.1729739431157;
        Wed, 23 Oct 2024 20:10:31 -0700 (PDT)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a77f25sm443287485a.103.2024.10.23.20.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 20:10:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/fvp-base: remove backported u-boot patches
Date: Wed, 23 Oct 2024 23:10:26 -0400
Message-Id: <172973942611.1244444.9210888128268089430.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023193949.59449-1-jon.mason@arm.com>
References: <20241023193949.59449-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Oct 2024 03:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6225


On Wed, 23 Oct 2024 15:39:48 -0400, Jon Mason wrote:
> With the recent update of u-boot to 2024.10, these patches are no longer
> needed (as they are in this release).  Remove them and everything is
> happy again.
> 
> 

Applied, thanks!

[1/2] arm-bsp/fvp-base: remove backported u-boot patches
      commit: 2386fd0da987fc0bb0ce54613f29f23f9ca38445
[2/2] arm-bsp/tc: remove all references to total compute
      commit: dd4f41232254d78d691efd61e3c4758dff6585b7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

