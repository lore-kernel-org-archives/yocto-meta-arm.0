Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12494D216AA
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 13:49:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.14094.1729000187664182892
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 06:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lf6mkqYd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cbcc2bd7fcso34645176d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1729000186; x=1729604986; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7VRjLEd9KvYSFfyhZEa5Y6hLHxcQcU9VZWczbWsgq4=;
        b=lf6mkqYd5WWJjiK/7olK4Vs2cCFLR7doi3Ts3WFYIyfez62gyX2EIowadpFbBzNtEt
         CXU+IZjFMivG1gLlZdvunW/2jVRQnPjSRoq/SEkA9ZuF9D9CeVLxj1JJs+zWBPPO+69z
         LOyCSeY1cyuSfUe2Z6g8oB9sEMXg/8PTYzVEAuyU9+2s3TZsCsRbkcrogRxcONLd+lrS
         tsFStvScb6rorJNrYm2b0KBnjYWoWozOvLFAhxkBiLd+ydsMe4TJMYcyioX2Ng3IiBb0
         grQioZraxbz2DBcXxCCyoXO+LN++N5hYJFoHJZiLxiwpdG4QSl6CVwoeI075p6by3CPg
         7+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000186; x=1729604986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7VRjLEd9KvYSFfyhZEa5Y6hLHxcQcU9VZWczbWsgq4=;
        b=F1lckLkQacAqfOGmfCfyx8Tmf2E9VqAia17CwicHrD0EHmWqMJjBEiBZZgPl/kPDcJ
         PoWlT8OUBMu7rdTB3tP8JEowU9Trk+VPzCzxTjYTi8wvAG19a/MiyILoshyCPZNgEPpH
         tu+Bcy35MWCMYnAARRYlUyTqtlDzoAPPukvplMqM6mQpxkLrFD2ZbcEAb8IvkGj4EdMV
         cELGil7JMM+Bgb49/qYXnubH0L4TQnHxxgklfpQ4CjTTF/ReSmX0EEqZxMLqNOc9iKSq
         y+46cN0qh5NoZhWlNxos1XjuDljVY82IJMaKOvKmz3gYE7gnycfTVmu8IQw7LoBrKHmp
         Myrg==
X-Gm-Message-State: AOJu0YzRq6dDe882elYB7b8GB5wYn2rjP06loESi4nsQWhCRuUOilgYe
	aq9W1rYiWRJL2xuOzMF291bQfRBJf9PuYuPtERyoWSs9ldArikVYzMJO/vT+S7Daloq74NhKqMk
	=
X-Google-Smtp-Source: AGHT+IGdbsXCvgQTME1DU3WYotxO/nHkmd6hQo83n7YfmMsq9cCPM45UwLfViinBc7zsx/OXsz2u5A==
X-Received: by 2002:a05:6214:5b06:b0:6cb:d1ae:27a6 with SMTP id 6a1803df08f44-6cbf0095668mr208913576d6.24.1729000186271;
        Tue, 15 Oct 2024 06:49:46 -0700 (PDT)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc2292f4b1sm6914136d6.70.2024.10.15.06.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:49:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ben <Ben.Cownley@arm.com>
Cc: Ben Cownley <ben.cownley@arm.com>
Subject: Re: [PATCH 1/3] arm-systemready/linux-distros: Implement unattended openSUSE
Date: Tue, 15 Oct 2024 09:49:38 -0400
Message-Id: <172900017888.4133599.6252501457808965245.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241008135730.58464-1-Ben.Cownley@arm.com>
References: <20241008135730.58464-1-Ben.Cownley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 13:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6193


On Tue, 08 Oct 2024 14:57:28 +0100, Ben wrote:
> Implement unattended installation for openSUSE
> 
> 

Applied, thanks!

[1/3] arm-systemready/linux-distros: Implement unattended openSUSE
      commit: 02ba927dfce311df52b468188f1d7349f300ec5a
[2/3] arm-systemready/oeqa: Add unattended installation testcase
      commit: 0e0b9e608c7fcafe054a4ed8a7bf472ebeb38236
[3/3] kas: Include unattended openSUSE test
      commit: 33fa7e75edd76cba0cd55bbce4efe8acb7b4f648

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

