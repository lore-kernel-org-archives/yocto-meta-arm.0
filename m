Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81993C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 22:45:00 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.22139.1713653090918071067
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 15:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=HzgIgjIM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-437274f3bd4so24432791cf.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713653090; x=1714257890; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHjU/U0LaqMFcmZd0YMxNWCgKKrTlCKJs4upaLDN0Jw=;
        b=HzgIgjIMoM4lKz95VxT+gYqeyIBtLbyeXcPqq5ho8T9vHCGG0QH3wlgQPKjuiRhXCw
         JeLfyrG1Md+tE+I+HFulyvmxy84wAmFn0UG6aYoBGv/13JBKvjG+X8bs0d4qx9OaTaNE
         1eUCSE5gThlkUhifOgcpwIz9uDZEjQkLFLOzB8wFG2DuhDJFqoFdOkpl4iejWwMFHXfR
         bhO99hl9hDL0QmPKq1ngaMkUpoPNj7XI0S8PWeS6tLv3oRAW9hxBtdTDojMkMsHtC4mg
         JzOlb5EYGFquDJ7/Fm7Vs2tLPlaM8xsXLTnD+7YvyqZtXDBL0nzjdJ1gZ+zSSaXE9Ova
         +oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653090; x=1714257890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHjU/U0LaqMFcmZd0YMxNWCgKKrTlCKJs4upaLDN0Jw=;
        b=JpZS3faMFBgg9kMs7+0jY0c/5IeznBlxAHAsW7nf6HHuGHJMxW81sWZ+N4nbsfwrzn
         EWqO0NXVqkN7rM/7axWmEqw/Wm9jgssvms0lToiuCeLoSRx5yvkt9nQ+qN2AoBl5L2kH
         6RFWrRbcEQF2kKi7nBcpDtoUBSIvACgk5ZYy/mHe8LYKhzAAFi8Ikw45fp5ehxyCFgXo
         vm+qfYv16GJm0yCsbolhkZRo7JpExHmSItF5S0VwDK8MTKFvow9zW2SC7cJhO+OSTYos
         KDD0B9bKuUHIRsbkpVULAkYtdXpK9qy6eEU5D/4RGeRsDnBnX+LZamwNh7Gi7q477mKn
         0x3Q==
X-Gm-Message-State: AOJu0YwqE44OThiJDwopAg3blVovRpcyxFxq8qG1YNGAZEugEbx6V9eC
	tbrPRKhavAL6AZeLue7BOA/wkEhp/zjt7He2wj1ATZOi4dIs+tyiSDfMdMyN9fBn4mQvdpE6tSo
	=
X-Google-Smtp-Source: AGHT+IEhrayS/zGRgtNXdGiQFDPN5cxBDlYXASBQq2EeoWR53SJdjYAiWmzO8IPdaTRHe+YTowJo5A==
X-Received: by 2002:ac8:5749:0:b0:439:80de:9521 with SMTP id 9-20020ac85749000000b0043980de9521mr2765067qtx.22.1713653089862;
        Sat, 20 Apr 2024 15:44:49 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b13-20020ac8754d000000b0043718726f76sm2840440qtr.90.2024.04.20.15.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 15:44:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	amr.mohamed@arm.com
Cc: Amr Mohamed <amrmoh01@e125330.arm.com>
Subject: Re: [PATCH] arm-systemready/linux-distros: Upgrade the Debian version to 12.4
Date: Sat, 20 Apr 2024 18:43:17 -0400
Message-Id: <171365299860.816258.9145274508325805000.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240416135827.3267784-1-amr.mohamed@arm.com>
References: <20240416135827.3267784-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 22:45:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5571


On Tue, 16 Apr 2024 14:58:27 +0100, amr.mohamed@arm.com wrote:
> Upgrade the Debian distribution from version 11.7 to version 12.4 in the distribution installation.
> 
> 

Applied, thanks!

[1/1] arm-systemready/linux-distros: Upgrade the Debian version to 12.4
      commit: 463aa8fe14ccc04d4381eba376ad0ea90a0bba95

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

