Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48321C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:30:26 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.52933.1710786616628790081
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=O+nstiMX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-789d76ad270so274577985a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786615; x=1711391415; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10M93xdL1rrzeRiBsAWqV+Xb6xkJ1YB8quWcBRDy0Sc=;
        b=O+nstiMXKrYoIp4cJM0Zw+6BGHb/wy5gCpVNm3sNxImcPaC9aBzxIdcaOjHpO7UXtv
         Js+pxM5UMQB9RahYmO3snGIwaDuuKwufDYZMYt/N3oMYnot9FoHiz+HLotPM+jAb3yRA
         DSq/IgqU8sFc///BY+XaESw8h92y/PPlr8QT23AgD7iTmGJxkQfKzMl+SbbrE8DUqFkW
         vnGDcg4owiu118/44qu8fyHsj7GEpdcosO3N/tFgl2qU2RZZ9oRLhFrtYcPBFaQ+Q4Va
         Ii4Qw9KvZra68b72En3oH+XZwV/Te56K87VSVI1pk2x/vswDb2rP3x678sBRxP1cpY5/
         b/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786615; x=1711391415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10M93xdL1rrzeRiBsAWqV+Xb6xkJ1YB8quWcBRDy0Sc=;
        b=s/rYqZ/vJebXLmjNVtD1RW0gZFDD6uo+ocRq7kGlunXXf49y7l0PwCXsRJFjwtXvte
         m9TGyet4dzQh9hfR96boHXGQX/qZrO0YHWcgDJJLjxft5TOphc0h/eaXvB33+UQXK56b
         81RvnD9s6RES+lfQ7h1KruGkwHqo9mtsCKqEuPsTny4PfAyxbd64uVVj6UkP1907drXy
         AkRsEH3AE83uSHykgTkpL7uW6W4o+or4TSrRv2LRM/goNWsxHK7anmpDmfKTFA9irkIT
         0HE8lcGQO8PL0J8W5k6WMWO+8UEOLhCgQ+ymc/dM4fxSbo2Mp57smY+L6U2FOU0A61K9
         +ILQ==
X-Gm-Message-State: AOJu0Yx1v7pIsA1quQgKIZKgk1t4elbIABhC9h3EshWm0qStEEpC9uon
	B1RkcS9PFtHHJif9w72sfsJyiOhGhDeqkPTWaMHDOiLAfyBGtD3z5GKMtXO9rBykwh9kmgjGAFc
	=
X-Google-Smtp-Source: AGHT+IGBxnDZUII1cR32+m/xVvfGlVq4KKfkGgyH2JkUpODWQpuat1chtQPTdoHuFw5KMUVZmu+PGA==
X-Received: by 2002:a05:620a:2987:b0:78a:119:dc6b with SMTP id r7-20020a05620a298700b0078a0119dc6bmr5254182qkp.59.1710786615457;
        Mon, 18 Mar 2024 11:30:15 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c14-20020a37e10e000000b007883a49baeesm4763820qkm.4.2024.03.18.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:30:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: Update EDK2 version
Date: Mon, 18 Mar 2024 14:25:32 -0400
Message-Id: <171078633836.3024366.9388371423558003691.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
References: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5450


On Mon, 18 Mar 2024 11:35:30 +0000, anusmita.duttamazumder@arm.com wrote:
> From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> 
> Update N1SDP EDK2 version to 2023-11 and rebase
> existing out of tree patches.
> 
> Anusmita Dutta Mazumder (1):
>   arm-bsp/n1sdp: Update EDK2 version
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: Update EDK2 version
      commit: 299003f7fcf85a294cb9351abbf9f5961dd4a36d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

