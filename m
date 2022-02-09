Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E3CC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 14:26:18 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.27177.1644416777085762394
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 06:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=B+qwbJ5x;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id e16so1871276qtq.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pewhzpcmHgkorAN7qVio3MJ8Uv6amZmVkvADZRJ1nJ4=;
        b=B+qwbJ5xy25y16vVZ0dQ8M7YXkU7Cc4FMhGw+4v3J6H3J5aG8VT6gT1tZt+7duUZ0Q
         o2FdfcN0UFzktyvm564O8xb1qachFH2uzvH9JB120yU0bQ/t1Spb9NafCGOtZGxZ0PEC
         LTY2YDGuffWLwHM4V2CcU0bDx7VeY0fmqCulKvog6qwTrooIs/OBv12M/HUIMQZ8hfYR
         zvEq68mlXoHqQ2EpcJeTVU7V85wnrQALwQaE4jPCVX3r2NhUunTwzSkcHgmUYJxLOzCo
         3aPKa6oVSTN1Em5EC98PFOZokgDbaysQOihnAkEHB+XzZwBWsC2Re2KoyjhU1tFcbmci
         xAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pewhzpcmHgkorAN7qVio3MJ8Uv6amZmVkvADZRJ1nJ4=;
        b=wR5Ctx0DYYViGT8zJp//dWhfwFlJNNPFLZU95WUCgOhLHFtfOk8tArgeI7D4T9OkDT
         pso4jv9w/+39urPJcTCMJyAUUGP1JBqOaKWB20d3TQawicGh6xfzPWmBLyl/INsJz82O
         3Yio54eA+PKXhmEe8laRDP6mbIkBRoyRUHev5DreVstJG+yV0lLG2x4n3yoTUXWgGzKL
         fAC38CgOVeRyhtlJXCaskDG9GmcHc1mob1rhCTONrNvzWTdWSg0KayU+0OGPowqqkaIm
         eiV0tEvKxmnSt/x3JIqLBsSW4pVg3Ud6Jr9oFps170/w3BsvYk7gh6UUc/IJtYNkKxgp
         5h1A==
X-Gm-Message-State: AOAM53291i3b1MEvxwzN3EH+18rXqNE1AqbebwVHrBDReNKrrHGjUQBp
	M7+ueapFcUjML7+PHqylDqS65ugxGe6ULA==
X-Google-Smtp-Source: 
 ABdhPJwaJAO1f401UoLTBbs8E6wzG8JSatiRj4N2tlaJWsAPFBoXjsxvxsDAf7DB174wTkcz25865w==
X-Received: by 2002:a05:622a:4cc:: with SMTP id
 q12mr1473902qtx.561.1644416776173;
        Wed, 09 Feb 2022 06:26:16 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 r22sm8989790qtw.35.2022.02.09.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 06:26:15 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp: space clean-up
Date: Wed,  9 Feb 2022 09:26:07 -0500
Message-Id: <164441676784.2001848.11795730406376786632.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209041315.13812-1-jon.mason@arm.com>
References: <20220209041315.13812-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 14:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2964

On Tue, 8 Feb 2022 23:13:15 -0500, Jon Mason wrote:
> Add a space between "Submitted" and URL

Applied, thanks!

[1/1] arm-bsp: space clean-up
      commit: ee083b940bc8b0ab391f2845f401327aa35fa1cc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

