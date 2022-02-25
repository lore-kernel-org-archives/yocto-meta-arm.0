Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800A7C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:01:48 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.6730.1645797707622447068
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=E8AKhJV9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id g23so6731695qvb.4
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4bdXca9eOUZta9XnNrn9MeR9b/ZsM5mZGZBbNNvuLBU=;
        b=E8AKhJV99Y2yFsC010rj6v9U3iGqQ2/+UN66LJOc1HUurqt7OsMq73Oi7NUNVHw12/
         VAUhhCRycMYbDw0XAoEWC5IkP4fkDKASF/oLLQ5yRi/jLKovoIq16fYHEnS1qXtm+qTa
         SPBiQw4FJwKHO28Cf0+8mYspwG8hEHwvsnQJZST+C/BTvWsghvbnPFQFYIQw4jFzhlrj
         GkQd8I3IY1qvQ6K7fwuUINqOJ6edWQXHtP9ZYqeRcM/6T6VN9rTGHcz6ixoDQKTJvfWu
         9S/qR6Oak0lvXUu8XvZ/bxfXwjj8CmW22eR5usuEqAuIWRVnDfcX8MIzOuEXmsKfRDPe
         k7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4bdXca9eOUZta9XnNrn9MeR9b/ZsM5mZGZBbNNvuLBU=;
        b=WUuHrcqsBDWVRZyaVTV071GZZuVPzMrZW356hayADM/sTXXm3nY/E4UMqQCfWQzY+0
         nQnnZlGeg98uYtzjckqQxYTotpPj/WwcfXaUfMu5etLJ9DXhu6ShK7VD1cvmQ2BfE6cv
         epYVnjFvQK4wy0tksSmoH5toirbCYdkeGzw4WmfcYxSJlq/4RClourtZujaSCblcO+wB
         448qpeXHiKY4zCm6o7UW6YSwxqKnVGaH+XO4M+wZBjvm7vEYqC45TtYIjA9kC7NCvKRK
         xYmdryhO+YOUUNaBD3t8FDPAp/v2FNdmWpnBinp2GGYfv+s4AjUb3SOpVwEEXCLUuGLY
         SZbw==
X-Gm-Message-State: AOAM533MgpSEDSzqXoJI92ROEtnBAIL+kg3TJ4gxLcHZqFDcZjZrhB9I
	ubp+jzBe1BFSrwPvF2awAwDJZdYqtbE7NA==
X-Google-Smtp-Source: 
 ABdhPJy3JyI7v2Zb2BbBhgmZKJH0GFt4PxDMQaJbQecGd4aQD72VrYAqt3VQoPwaOHiHuzHqZswLZw==
X-Received: by 2002:ad4:5442:0:b0:432:1429:21f6 with SMTP id
 h2-20020ad45442000000b00432142921f6mr5858075qvt.72.1645797706599;
        Fri, 25 Feb 2022 06:01:46 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:ec60:a2ee:9645:ec8c])
        by smtp.gmail.com with ESMTPSA id
 m23-20020a05620a221700b00649555cd27bsm1217400qkh.79.2022.02.25.06.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:01:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/linux-yocto: enable autofdo config only for
 TC1
Date: Fri, 25 Feb 2022 09:01:36 -0500
Message-Id: <164579769793.11432.17328211300468640669.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223171251.3156859-1-arunachalam.ganapathy@arm.com>
References: <20220223171251.3156859-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 14:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3067

On Wed, 23 Feb 2022 17:12:50 +0000, Arunachalam Ganapathy wrote:
> 


Applied, thanks!

[1/2] arm-bsp/linux-yocto: enable autofdo config only for TC1
      commit: 3c16dbc0c61055eeeb5534aad3c2916740a47fd3
[2/2] arm-bsp/scp-firmware: add patches related to MPMM for TC0
      commit: 185746b66ace598c4c9c7412324e4d2a1fcc9b24

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

