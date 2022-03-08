Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB5EC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:18:08 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.9268.1646752687024665262
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 07:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ZWTxFd8p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id s16so6809385qks.4
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CfBVX/7oWcFESdcdrEvN+1oMScbE1Fzxl3xfcttBw4M=;
        b=ZWTxFd8pbMBXBj6IIhonvkP1LxrP6Yr9Sj9H1laiKqYHzF+4d3ysgQAhGe13ajOI22
         CCQSeE1PsFwVLeQmFx4+bozM+Q98Qqloz/z31QfhRtElDUPsyPE08HpuvW8IKJTZN2FD
         H+eV3LLjf/SgWiKSoE28RQAWP+wwwsgLhM7EW3xBDrna9K0m68IcYeT5tgKZJh8b93U1
         +7rMpCX6ezcLRCtAh+GQu12o3GV7g/oJUyxkSfC8OGUGax01Z55vfSievRVn8v9okpfV
         OLGIcvIa22u+tBOjykuza4nR6wzB/2tntVlN3tBJYWc+YDMsxzk4sLmDTK9rO5KRyKra
         IinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfBVX/7oWcFESdcdrEvN+1oMScbE1Fzxl3xfcttBw4M=;
        b=fKwg6iAdBE2dHK8Cqg2T9LXoYCCdhTjJTFmibC8pZyNH/XU4tgpEoby8OoXhuhqBsa
         Nuc0uNQfB6OGFFU5xYVW8PohOYwXuDk7VTZk3RJiwGxMrdqKFWZ65cV2c/K82SOMB84q
         2WMzBnP1JdS1mnguA6KnV5JeU/zJJ7VL+tOCTdxf75QduOssk739YT5YnYF5rW3ECOo5
         vWLyihPy7fdVbuwkIqnBAt+vBTylx1P2OsijVDNaOwbosbqUp+zpV/X3CgZPXDgvxuCE
         v/asikV+NtEohhTb5tDBExZyPHq9GDL1wOESO8x4wk5K9wqfQrlMyM8ZKc54FpTjQm+h
         xH9w==
X-Gm-Message-State: AOAM53010zDZKZaQ32wbSG8pYTLrcx2LZfAeQIKuyLhxg6rffTGGRmKB
	vj7OgUgPecMFl38H+Y4gjiRbHR9ebSznsA==
X-Google-Smtp-Source: 
 ABdhPJzsVt3Y3iF0OMq6ALF/7W6MwNx52BbY/138CTsX7jF+nuGnLTcQw8L8nbrpq52/XrKE1H7QcQ==
X-Received: by 2002:a05:620a:4148:b0:67d:27b3:8d66 with SMTP id
 k8-20020a05620a414800b0067d27b38d66mr1057545qko.352.1646752686017;
        Tue, 08 Mar 2022 07:18:06 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 i68-20020a37b847000000b0047b5486eb0bsm7807610qkf.62.2022.03.08.07.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:18:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH honister] arm-bsp/docs: Minor fvp-baser-aemv8r64 fixes
Date: Tue,  8 Mar 2022 10:17:40 -0500
Message-Id: <164675266002.619768.3710220928200461039.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308112953.3800922-1-peter.hoyes@arm.com>
References: <20220308112953.3800922-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 15:18:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3134

On Tue, 8 Mar 2022 11:29:53 +0000, Peter Hoyes wrote:
>  * Include `--upgrade` in pip3 command to ensure latest kas version is
>    installed
>  * Ensure all underscores are either quoted or escaped
>  * Fix P9 example command

Applied, thanks!

[1/1] arm-bsp/docs: Minor fvp-baser-aemv8r64 fixes
      commit: fbfd015578f1c206c9d44b5bfda485c81c411e0c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

