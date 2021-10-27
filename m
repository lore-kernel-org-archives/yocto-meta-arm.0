Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7087C43217
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:50:05 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.14616.1635353404636066588
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 09:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=zRiUVnj3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id d15so3019599qkj.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=u7iWrAAj4fUtfcxIrZVpn4FT35s/ArxaRuSGoi/yNSw=;
        b=zRiUVnj3iaapfuGprDdBXLXVtDf//ojq5+fDq+3vmTUjB98pPkk74k86aVzf8VKm6X
         O2zC4N8a7dVsraohn3IkvOuPshufAaGQvrJ5h2umXXK7Yh5EOtaUMzSuOFSxcUwHwDv4
         GN+jd0K3vmplzYp/SVpgSW4lmpezdm2yT5OX8xnfzeWficoBg2PJG5Ewcl0Re6QmRrP2
         d2P+PvB6BwN3lgLHtYx8t5trIiNyLbN3XHphqJJJAUTqXpGkZAWiQLmAJTQV+reDiqma
         5WCBJtTrqn/IW0j0RQv+kqhFHrqoolTfc1cpw+uJDMrVZS4gtyTR5mcWlyZEkQfBjUgO
         F4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=u7iWrAAj4fUtfcxIrZVpn4FT35s/ArxaRuSGoi/yNSw=;
        b=MekxUZjgTC6oLs7SLAdmq6obhQcKMDdHWXa5nHeSlSVLwwD4OVjZXKKakc913w42Ry
         5mTfqf3YkzNOOwgkGZvPlvmWStho7Jfg0AX7wZAuOIegKVaINi0QOsLgnsI0OjX5MPNI
         d9pyiILJY2VjhQ2GMwjISZgPOkLnk7ShQSFqqicJ2862KJf0aTAVl1zoFIaq1kDs5Bdt
         qIh25VV4jZ8nzEt5moBh3jKhcPmNdP1hZuSPk8bRaIJcpzVMdkOGFNwnVd4505DCg83P
         zbHNPakWiLg58mqBto72+oaxlKRQy6XFu4IW21n+TEttQ05rczH2aFvCkd1dLzVJj5Sq
         uMig==
X-Gm-Message-State: AOAM533V72oOol04s2XUQr5nm1eY8XEe0NoS7yZjyaU1CaSZii3l9fk+
	T1rStQYwp0kYvFf7TKphiomMbA==
X-Google-Smtp-Source: 
 ABdhPJzrSMx8YEVZAs3sS1Xjvb5bNP8jz+OlOXwJLZz1CUWidybgcaT0rF26vG4emESJDokky/Qspw==
X-Received: by 2002:a05:620a:1031:: with SMTP id
 a17mr4595846qkk.339.1635353403831;
        Wed, 27 Oct 2021 09:50:03 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:40aa:523b:a9b0:877b])
        by smtp.gmail.com with ESMTPSA id m6sm241353qti.38.2021.10.27.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 09:50:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Wed, 27 Oct 2021 12:50:02 -0400
To: hardknott@athena.kudzu.us, update@athena.kudzu.us,
	meta-arm@lists.yoctoproject.org
Subject: meta-arm
Message-ID: <20211027165002.GA18546@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 16:50:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2307

meta-arm has released an updated hardknott support tag.  The tag	
contains 49 patches from between 30 Apr 2021 and 21 Sep 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.3.1) with a "yocto-x.y.z" tag (i.e., yocto-3.3.1).

Thanks,
Jon

