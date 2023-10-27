Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D428C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 04:10:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.95.1698379798305237121
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 21:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DqqnCp2r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7788f727dd7so122676385a.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698379796; x=1698984596; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDcxJH9GJ/jJCePo4Blz5t0aXMYAqr4FssNQlg/Lzow=;
        b=DqqnCp2rUi424YKnJFQy5W1pECj9YB41AipJhrbFzRbcye+jRsJz/z8lDr/SlvLbG2
         WiqXKDUKHCMWFZJoOo3lp8X7+dUmgaGTMn7ul/67rw8i54dY1KPKDxUfVZSc9w+MoRDN
         kdgRqpA7wcGZGr1MsE6ReuBZgUXhjEEPUKFA0C6MGLzew5kT8vtjl5JCqLO+/rou/wwE
         1hlky+gKcGUpRM5tJSMK+KCToJiqEM24pNmyw/12JC2Q108o/ZaJznDpXDDmQcj6b35c
         wkdBTcucG9xCl1RHsggD+HOFA30cSwhY+i2HZHhMAphJVtGhgtJS6+HfIncPZQkH4/IN
         /7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698379796; x=1698984596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDcxJH9GJ/jJCePo4Blz5t0aXMYAqr4FssNQlg/Lzow=;
        b=cmToPe8HdKNy8PmSQHRViq1iCKKgp4BI7PDXz4qdcpTCx6C9ujViI6K4p4E1OqYDJE
         5UUYNtTGOGSCnj4GLgpiTz3WpljFGEF2JCh0aNLXEkhmAOzJ6frXpmPsJ1DymL8Snzt+
         mQJ/ktvI8JiaBB1rQtNTn0biNG1rNMLYV7GRWSufwMyDaRfZJq+IzlbVHfzT4TG8aG6m
         Wo5l8nyG/4JemqBR+3UYRIHNvMeGt7ROlOq+jH8A3p5DpwFS8uqSg1pIju3XEr3alUdK
         5YYCocGUN6X0ttQE/IFkusU3Pb0HG0uM21J2kWQYiu6e6svOOxMS24+rJVe19KOJLpW/
         S/pw==
X-Gm-Message-State: AOJu0YxYX6O05MNciD+azbFyeyVnLbSycZNQVee/10DVp2bBxRNu7MZA
	rInY/QfnfM/SK3KAAjXPof2WBCb8cH6kGTDWobE=
X-Google-Smtp-Source: AGHT+IGCSGtv4cCDdJtUONl7NxTgEyysXKu0Q9f/3AeIhN+W4OfeFeOs3Ct8EtIc+pVOT1GkNhk0oQ==
X-Received: by 2002:ad4:5c6c:0:b0:65b:1594:264e with SMTP id i12-20020ad45c6c000000b0065b1594264emr1759412qvh.51.1698379796482;
        Thu, 26 Oct 2023 21:09:56 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id a6-20020a0cca86000000b0065af24495easm317843qvk.51.2023.10.26.21.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:09:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/u-boot: corstone1000: on-disk capsule update
Date: Fri, 27 Oct 2023 00:09:22 -0400
Message-Id: <169837976564.3801272.16428613288788001539.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231026124303.2433202-1-emekcan.aras@arm.com>
References: <20231026124303.2433202-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Oct 2023 04:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5185


On Thu, 26 Oct 2023 13:43:01 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> This patchset enables on-disk capsule update and fixes few missing flag checks
> for capsule-update.
> 
> Emekcan Aras (2):
>   arm-bsp/u-boot: corstone1000: enable on-disk capsule update
>   arm-bsp/u-boot: corstone1000: fix runtime capsule update flag checks
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: corstone1000: enable on-disk capsule update
      commit: b3f58a0d09b01c813e3988e7ec8736642d77e954
[2/2] arm-bsp/u-boot: corstone1000: fix runtime capsule update flag checks
      commit: f37dc57c5482cfc6ccdd4e26a261bf1bbe96a8df

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

