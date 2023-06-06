Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7173DC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 03:29:58 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.806.1686022192014759792
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 20:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=RWxvURNZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75d46c7cd6cso231001385a.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686022190; x=1688614190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcAzWNY+XGm+MRmt7e8+jdhlGwxATV9tWHhcPkfjCMk=;
        b=RWxvURNZuiRwdJSLY8mxLTnmhUuslvDIJBTzp5JJU0vqyh4WUmqYXT5SbxoiI1hHcO
         ySnuefh0FC1c0mMCyWaza6ba1nyFgWry++kOueuu8xL9InaQvbPSWBmuWIv7xIDpJQ+z
         fmnM+Hq6YfLAoyXdo1bHAP76WpQTpfbL67NS9FaHq8k+4ny6e+unFXhQn9G0l1ZX6eYS
         fTdjtApt5568K6gKPDA+AhVjEfVZofyx01MpJ19CTL0ynp5SGfUifyMXO0Ez+NLj4kfY
         uQ1ctBdk5B8znJLo9zQFEchqO/kiHrPJBizqcgsjvdmBGmphKplBnpMy3r2o4193YeuD
         rz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686022190; x=1688614190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcAzWNY+XGm+MRmt7e8+jdhlGwxATV9tWHhcPkfjCMk=;
        b=MK1i1DZy0HTWU3VxdhzBo4euTC7mnAMBuiLXAgnib1nOp3lDCSnU9uoMvkeU963pde
         AA0s9cF0XQvLx8+4JD6Do0hWdw2OpxwOB8HmyBMXzfqkhs7efk2RJxvWv0PtZSwa2Kt6
         Najedm7LXRxmBhWdzhac2OyDharkOimzfnz01cBQK/V5PJCksVlyYsDYXQDbqGPAUDKv
         Z6Qqez0swaaKBKGf9ErBOwuyP/KkREL0V1N9P1iEQ4jnPPnH4X7upbTVb7i3+U81a+Ew
         /T5gOfdfLM5MHPp79SBxb7rdE7gCyJ3BCU+wWmdRhM++GD6CpX4Ln+8/yuyQNo55c76G
         j2GA==
X-Gm-Message-State: AC+VfDx6iSAyYungcYQhg1jPOUzeLBluudcNu4Tl8vx06Iz2fRmXdSo9
	1VdLFZWY7wM/v/Puxze3TDD4Ztc1PwieUVEaPtM=
X-Google-Smtp-Source: ACHHUZ4qNgZXMzq62eKySh9lY2dxuGvHb1h9njHplXy9oG4rZeZg3inwadF81idHdoC0Z4sndluorA==
X-Received: by 2002:a05:6214:2a46:b0:625:aa48:fb75 with SMTP id jf6-20020a0562142a4600b00625aa48fb75mr1014843qvb.63.1686022190629;
        Mon, 05 Jun 2023 20:29:50 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y7-20020ac81287000000b003f9adf7c9fbsm413535qti.71.2023.06.05.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 20:29:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/linux-yocto: remove unused 5.15 patches and inc file
Date: Mon,  5 Jun 2023 23:26:42 -0400
Message-Id: <168602200239.555009.15037379827701332398.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605130156.3309199-1-jon.mason@arm.com>
References: <20230605130156.3309199-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 03:29:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4729

On Mon, 5 Jun 2023 08:01:53 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/4] arm/linux-yocto: remove unused 5.15 patches and inc file
      commit: ebe669ad9c75a001c367d9835f79856bf32a6de9
[2/4] arm-bsp/optee: Remove unreferenced patches
      commit: 83ff3b1bd6958019d8d7a18ad8bf6881353b7f92
[3/4] CI: add debug yml file for ease of use
      commit: cc9859e5b315f4a0374f8e6763498e926ef2488b
[4/4] arm/linux-yocto: add gcc 13 gimple backport patch
      commit: 864d2a2c6a3adb4347763650bbbe5f4bffa96bbf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

