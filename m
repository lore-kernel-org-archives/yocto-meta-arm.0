Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EFAC19F28
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 03:06:38 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.9685.1659236792366117742
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=xwnwC5jm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id i4so6211313qvv.7
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mucyUz72jwpG1xke3rP1hw2EOV7K7+5SaBfLA5Ck50I=;
        b=xwnwC5jmIZpZf6pUstO/0QkAEM5z5HpLIPlz1YqmHBESbIZQwMrPbF7/2rLNfzEXaS
         0qeXufZBi+Td9eJVnDV3vySeXpNV0msa8MBfHSMEeQ41ZTISOy2f4vL7N5Apzt7ZFfgB
         71hMijUn5hPsK9sUahz4d460ylV9M2TAkzRizd/7RYvJA8nCT88oJKIxmPY9khJDm8VP
         E6e4qmAL1gyDP+PFLJHEnNCbeOXrl6/f46+1jrOMZ1x2xsbE/pHkF2FWMuEorx779uOz
         VTSnVWH/7jy4CSW2Ai4GR5FkyLD/b1QkQrNfjIbemJVXPaUbtFRpwwGaMkJWuys4HrWp
         PI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mucyUz72jwpG1xke3rP1hw2EOV7K7+5SaBfLA5Ck50I=;
        b=IKefYraDvTdaAmrIPS7WYqZtDenfH7jhItgx5tp9ERhLj0oftdXe4BmbNBxq2znStk
         bgvph3ScM4X2u3Y5cg7fbV5sx849dfnj78HUM/QV7l6ha4qHjRRWUXNJBAmTw8hEoWYN
         E5vQYpm0TYBm9DAj9CffrbwmT20BwYdebJzmTcrrNoz7UmqvaYsRpwtbHSMDQNiar6i6
         DnhMKmzTvTxwMByg/nz5NzDaEt2YATcPYB1z5+X+WXIu4cTgrQ1UsRkUmhH5Yz5x2QV7
         +RFZl6MhrzT6+5PCaGKh+/kHHRNGDo0dluorW+Mql5PlTApOeQZMC8Q7b4a4U5AB7Gf0
         +Sdg==
X-Gm-Message-State: ACgBeo1x0AmRWnxnZibcpldMm1HCzqgJfgB++3fUVPHTLi11lTuT57f4
	+nAGfOYLCJgalD1Lhx+N1U6+GVWMe1oXGw==
X-Google-Smtp-Source: 
 AA6agR6QIjoXbyr6LkJ4zJbkFVbA4hvXwwy2tZsJ2ESDrGpNsIdhRoj7SglH3gKobUZ3Wr0ILZTNrg==
X-Received: by 2002:ad4:5dee:0:b0:474:56:2d0c with SMTP id
 jn14-20020ad45dee000000b0047400562d0cmr9541720qvb.50.1659236790982;
        Sat, 30 Jul 2022 20:06:30 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 r11-20020ae9d60b000000b006b5869c1525sm5919426qkk.21.2022.07.30.20.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 20:06:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP (fix
 aborts)
Date: Sat, 30 Jul 2022 23:05:42 -0400
Message-Id: <165923674540.386450.11391674133900455380.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719125325.923598-1-adam.johnston@arm.com>
References: <20220719125325.923598-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 31 Jul 2022 03:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3625

On Tue, 19 Jul 2022 13:53:24 +0100, adam.johnston@arm.com wrote:
> This patch, from N1SDP 2022-R1, adds support to parse NT_FW_CONFIG to EDK2
> platform code for the N1SDP. This is required to fix aborts seen when testing
> virtual memory after enabling trusted boot.
> 
> NT_FW_CONFIG DTB contains platform information passed by TF-A boot stage.
> This information is used for virtual memory map generation during PEI phase
> and passed on to DXE phase as a HOB, where it is used in
> ConfigurationManagerDxe.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when accessing virtual memory
      commit: 2b392ebd3cf92cf1f62b53a13774649ca6be11dd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

