Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1361.1592851440135314888
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 11:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 719E440BA1;
	Mon, 22 Jun 2020 18:43:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzN3u_L1WC67; Mon, 22 Jun 2020 18:43:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4DDC4407DA;
	Mon, 22 Jun 2020 18:43:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B53BC170C5B; Mon, 22 Jun 2020 14:43:55 -0400 (EDT)
Date: Mon, 22 Jun 2020 14:43:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Gabor Abonyi <gabor.abonyi@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200622184355.GH17660@denix.org>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-5-gabor.abonyi@arm.com>
 <CAAnfSTsX81c+YWMV1X1cNFaKfVCkB2gP0bykdwwondGYDBUDxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsX81c+YWMV1X1cNFaKfVCkB2gP0bykdwwondGYDBUDxw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2020 at 07:23:24PM +0100, Ross Burton wrote:
> On Mon, 22 Jun 2020 at 08:15, Gabor Abonyi <gabor.abonyi@arm.com> wrote:
> > Adds a recipe to pull down the trusted-firmware-m repository and the
> > ones it depends on. The recipe can either use gcc-arm-none-eabi-native
> > or armcompiler-native Clang toolchain to compile the firmware.
> 
> Looks like it's time to start that multiconfig experiment where we
> just build another cross compiler inside Yocto.

You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores and Armv7 
Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross compilers and 
use those for corresponding components. TF-M sounds like a perfect use case 
for that, as well.

-- 
Denys
