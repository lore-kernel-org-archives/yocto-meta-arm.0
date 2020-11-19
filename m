Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.10422.1605797968588898155
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 06:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=GiaLnhDp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id q22so5573140qkq.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5yeqwp/fR+GN0mqrP8lQPorZTk/LhY2rsKKkth5OXtQ=;
        b=GiaLnhDp500FzkbIsRVa6W1yQ/MXxiNEgPDI1N85hZo6iUynAlRiDhII3qKSku6+xV
         VSZt7phCtWH4MIIU58k+JNTcENi+OFYIbQ1GZtMwHPMw9C5Q+pNm99iUkoDmTw+Ju3hy
         U9pqNMOvgmha4ZSAYvgbUBvHBahttTnmKBZh/FntieYygWDNcQwwrf3hzxTF3SfTy9sM
         kw6ibUQvLHjlvj8TBHAtgLpWy1edhxQLPUpbOuI+hJc496rLbu56tTNEwpZSP49E3jWF
         e6K3p4Lc48/yk806N34/Gx+5mu9TuUs9r33JkyzOrK3LhG27CHkabreoExuU8NPK5COL
         mTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5yeqwp/fR+GN0mqrP8lQPorZTk/LhY2rsKKkth5OXtQ=;
        b=pGV7SVoYvokXEBuzvA5FGyzF8dL0QcK56Nu/5jEZF+Dx6PymXxNWnakRXYd8BfMHnJ
         oKZt7dBhP7S77GML5NmzB3ZMLj+FvZGA1wgMV4YoeZBPGquj833vEsQHqeGNHU9r6FNO
         tJixdCZpmRLMeUzCMLWQQQtg0FmyHaUYaoakpgWpFIJC2DQHRn7sH3EargfqXKhoHcfZ
         eAZJRQpvWNzIRSMUgME9SdGRDLODtXZwgT8qqpZBS8oweBh1tUO284AkzGCwYzZ0fCfd
         KiziOwFLCBiGX4WMSrQYvESYfW4n6fCAQWmPTp1FgxGkRRTG8Nl8YzMyHcLy1EWVgl7t
         9Vtg==
X-Gm-Message-State: AOAM530bVTEuHRIbt0dxI9SZ3Yojwm6DGbOmAbrq/0Djfr8WeQsLswoc
	3R9y0IMgjbaygSfHZf/5dLrxAw==
X-Google-Smtp-Source: ABdhPJy0KT432BoSSCFsdwWptRxXxgnGw/Dz2tAaRt3zSMuYuH6aIppxd2mAPJ3GrJSE8fjXG+LwlQ==
X-Received: by 2002:a05:620a:22e6:: with SMTP id p6mr11690445qki.174.1605797967766;
        Thu, 19 Nov 2020 06:59:27 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:c9b6:920b:7215:8210])
        by smtp.gmail.com with ESMTPSA id o21sm7822qko.9.2020.11.19.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:59:27 -0800 (PST)
Date: Thu, 19 Nov 2020 09:59:25 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-init: fix guest shutdown issues after host reboot
Message-ID: <20201119145925.GC13793@kudzu.us>
References: <20201116142645.GE20627@kudzu.us>
 <23918.1605625939826740250@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <23918.1605625939826740250@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 07:12:19AM -0800, Kamil Dziezyk wrote:
> Can you backport this change to gatesgarth?

Done


> 
> 
> 

