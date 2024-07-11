Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6170DC41513
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 20:03:16 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.1317.1720728194739501073
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jul 2024 13:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2wEtBlHl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63036fa87dbso9229567b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jul 2024 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720728194; x=1721332994; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHLtW5U+E+Xr1XV6aiIxE0xKuaBaJyrZ8gYmx0pE0Y4=;
        b=2wEtBlHlEFUYCbvsvFjFxg4qa9S55XKgsu1vcIsV80i4Nmea98e51F6jtZ0xwhdpo6
         6WqsRKoxD0GIqZtgVzMsOY9LpNlyHctOTyhevsMupa7nt/9/fSLekKP3Svso/hWMQrck
         5PtoUtRXKBGZUhERddpkEz+ju9RoBL91rgNKpaRJBZGzheO9Bv36Ums5TmLFzTtslghi
         hSWGBbtJ3MdaywJQjEJpKlhxxz/g8p3KBM0YnSAJwm21VDiMoc5soyAK3RtWWqqj3pMx
         maDqrhBmwFFOFAzK2jY3yjmVY86GMlWhNCPCxh3k3e194xlHUjC+stO8A8iE54qd+7i4
         Jebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720728194; x=1721332994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHLtW5U+E+Xr1XV6aiIxE0xKuaBaJyrZ8gYmx0pE0Y4=;
        b=FxqcdxI91DGIlihhQJzN+PtjT3gxN2+hK/q+7uDhDfXgvzPEP/LXoag/GtDx5purBw
         PFU1bKh+vVn3vBX3WSzgsIF/KL1/l0c7eGbKLpHefsczFlcpA+VeIqezt7ai7DNnT/vm
         vQCFBEjEY9wInf3H6OVHrMtgkoPTmHn4f4WjJvqh0o1IvRp7zxdOxVLCVjhsoZuuw4cv
         cM1756N2QnTfT2eXr4U9dC2HoFtDCVq4wY6XI+5N8M3+D0UL4EZ98rzSsSYKsGJzSxtn
         rslboQDkXKv5l0bI3tI426v/MTs9x0X7xnI8Ckg9UunihA9FmMwt7GjYgJVlw7tUjUqs
         AxiA==
X-Gm-Message-State: AOJu0Ywq3mF7OwgJF3cc1lCcU2zdldtEdKwcGXkFPNsbYbecSJzsUBoQ
	JtvTN1BgNi39FUEPhC+NHG8ZVUwKp8UQXlrzr2ntlqCdL7UcyNjmrRnazjN/2e4LtfyL11DXN/Y
	=
X-Google-Smtp-Source: AGHT+IGecJdWGh3k8A8VYHX7IonjwxCf/5YpQc3w824eRSpj8pP0UY0jcR/fIVWLkWSf1/QAq/GQiA==
X-Received: by 2002:a05:690c:6801:b0:63b:b473:1b91 with SMTP id 00721157ae682-65dfe20a73cmr7446707b3.23.1720728193581;
        Thu, 11 Jul 2024 13:03:13 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4d2b331sm12295077b3.44.2024.07.11.13.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 13:03:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: add poky-altcfg
Date: Thu, 11 Jul 2024 16:02:51 -0400
Message-Id: <172072817152.2708276.8532791323159116151.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240710142027.72102-1-jon.mason@arm.com>
References: <20240710142027.72102-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Jul 2024 20:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5883


On Wed, 10 Jul 2024 10:20:27 -0400, Jon Mason wrote:
> Add poky-altcfg to give us coverage for systemd (and the other things
> that it exercises).
> 
> 

Applied, thanks!

[1/1] CI: add poky-altcfg
      commit: a1b240fa55c0a3dec996ce379645ca195991b401

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

