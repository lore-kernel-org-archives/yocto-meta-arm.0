Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C4EC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:31:06 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.52959.1710786662127479650
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Meuz4KLi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-430acd766beso18763751cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786661; x=1711391461; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72Rs20SfSQXp/c0OOCQ9laDtpx2pfMnKx5tV00Un59M=;
        b=Meuz4KLicU+vc8JXYb3lUwwyVtXCaOy3NA9XdDMYpzY7tt2oF4ZMVCOkmHqkjeAv+U
         2OVEmWRNrk+3yNea2mm+vzpfVfQOulblhclIixYp1adyN3U+7OxXXjqb7biqVQOtVGE8
         zXTGxwjzGHyM993bm9tse7RJ5y20Rapee102HNcjwky72M7d5c6rj1QkVClklTk2LEx4
         oRFK52jeko603WvOSINasvTHpVlPkXeEZStwj1IZABMoU+GSJTGQrjak9gWnhGNZBVa1
         J1mtjmY7IUfATZ+VqCN1vTC4ymqWV/NF7F9V5Yuif5H5nyyQn+rgK+UvkFD6F7aW+J+K
         +b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786661; x=1711391461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72Rs20SfSQXp/c0OOCQ9laDtpx2pfMnKx5tV00Un59M=;
        b=qnyEuD1MlooKG1ZDJt6uPQUKvnSx6FK8CcW5ch+nJrPGfiqubUI39u1+WQuQHmSJ2x
         Amq5uAikbTu9son3FDsYj8VF/+c6y/yLg1VywDzMKrBInomhZXB8mP65fwbvwcia1Wxm
         +My97KM0ZWkazrJqOc0Xl1DVQnNTN/TQXwI0qJ04fxuE1MYFFeNeNnscs/sYeOZsEXwq
         3ivQOSqePmbXAlZSORUhcMTyXVbKn5o8WpmcUgDbh7xME3u0wK2kufYZYdhutfdjkQNJ
         cwMnnWYkL6lkGWu5kRbr8D+jsaQmy/B6ne/DwC75mUKcf7wASdU+IdnCjKNA3xXwM+8m
         jInA==
X-Gm-Message-State: AOJu0Yya7cFrIpxpkKgeuhWCAOBDR+0B48W8u86CGzhNzh1rwtLnVlt2
	snf1Vofkls8mtyujBP8GzVdCMA3b6ne1KAFL4AL3yKNrfZk+fs6nwJ1WS6b8uY90S1IPrY4bv3U
	=
X-Google-Smtp-Source: AGHT+IE/vY9svK4kKgR9fF5UEaSeORcBOvNHUxuuATbsEv/AMBKktZXgPN9FFpN00JTTT3NKukszmw==
X-Received: by 2002:ac8:5dc7:0:b0:430:d6f0:2070 with SMTP id e7-20020ac85dc7000000b00430d6f02070mr3060259qtx.57.1710786660952;
        Mon, 18 Mar 2024 11:31:00 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id j1-20020ac84401000000b0042f376886d2sm5230745qtn.36.2024.03.18.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:31:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] README: Add information about release process and mailing list
Date: Mon, 18 Mar 2024 14:25:36 -0400
Message-Id: <171078633829.3024366.16989055969301199135.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313182112.17829-1-jon.mason@arm.com>
References: <20240313182112.17829-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5454


On Wed, 13 Mar 2024 14:21:11 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/2] README: Add information about release process and mailing list
      commit: 2bfbb33518f7f9716a52d363460b233f4b2dc97c
[2/2] arm/linux-yocto: remove unreferenced patch
      commit: 74ac722826d020341ffffdf255cfcdd302f22410

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

