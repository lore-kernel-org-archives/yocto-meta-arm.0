Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048C0C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:31:54 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.8943.1663947111259456113
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=GFrMIbMh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id 3so309470qka.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=76vrYTXwUFGVX7LYlTABZ/G2fHxB+7tewIxQ+G9/x28=;
        b=GFrMIbMhnBSNSeT+jQ4adqnb+KqVKBp52ZxGj2bb3eJcMVdAjkLu9BTcNGhrLHg1K4
         I0zx6kguHov/Tg76w/G3t/BPbAnb8ZQrrB0hrtxv1JluE4gGIrO6KQUFj2eGn/CX0UyH
         B4RnLwPmxXUlpGsEDLC1MrRdI4FmG8Qi/0ZTV6yzPonYV5C1yehGkep6D+jkmuWjVXqD
         oePHoGpQ5hqdjuCl6JnbkbIqEcJC0lueFHoK2DPFxDg2IC/VIuCKZTL2eFAzr6r0AfFs
         wDaBjCL0sjCq/O8WM57+Tt95CKNRaD7cbAWl1Ficdqa5zBAreKkxZRcvHmaY3TqZfNCR
         T7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=76vrYTXwUFGVX7LYlTABZ/G2fHxB+7tewIxQ+G9/x28=;
        b=xFtzDkwqh11SPRwIuitr7cuTVUwt2JgYe6yt+4ZA/MW9sSqtr1oOHxDcK3sez+S695
         /DT4yuKYt3p+WhfulIGFwBc3SWqnklzhuvpSLtVaI9X5D6N01GDYRyJSaPUpFFdn5XNu
         p14CLCPz3eTMKT3GQytjEeXXg6ktNimBQqLNsfPPshiI9kfaqrXfQd2focjcMBNqx/56
         hLWVjNgX5Y9iTnTGKobrOd4D34jlffpJebt7X0l+Mnpp7LnWdlSGIsb2hG9ecC450UQd
         cwsmNXexcwdANWru6SLCt7HVZ4sI5v+Ng18Q2Er9mSeIv65ciYAV7kCGvKmSndNkf33N
         Wt6g==
X-Gm-Message-State: ACrzQf0j8h5uM6mhi5FfGeYXqA5DtfAKD2W8NVkbES6seDQeqOf+8Sx7
	AzV+4yeNFQrUFDBgKTwwPTJUTT13q/D/GA==
X-Google-Smtp-Source: 
 AMsMyM4L4edAYTPhFkburRoEfHXDICWJtrfAuvypH+wi4JEahv9oNzgL7FiHj/9j4QYDzkchLwy+Iw==
X-Received: by 2002:a05:620a:4306:b0:6cf:6c17:a93f with SMTP id
 u6-20020a05620a430600b006cf6c17a93fmr4776833qko.88.1663947109906;
        Fri, 23 Sep 2022 08:31:49 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 d20-20020ae9ef14000000b006ce5fe31c2dsm5820712qkg.65.2022.09.23.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:31:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/n1sdp: update linux-yocto patches
Date: Fri, 23 Sep 2022 11:30:57 -0400
Message-Id: <166394706727.2062239.8505589451090134388.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922125717.22142-1-jon.mason@arm.com>
References: <20220922125717.22142-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3819

On Thu, 22 Sep 2022 08:57:17 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm-bsp/n1sdp: update linux-yocto patches
      commit: cf5bccb0d62bd4a84d5e8be1352422ba6d66456d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

